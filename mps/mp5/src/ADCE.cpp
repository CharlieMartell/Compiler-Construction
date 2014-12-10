//
//#include "llvm/Transforms/Scalar.h"
//#include "llvm/IR/BasicBlock.h"
//#include "llvm/IR/Instructions.h"
//#include "llvm/Pass.h"
//#include "llvm/Support/CFG.h"
//#include "llvm/Support/Compiler.h"
//#include "llvm/Support/InstIterator.h"
//#include "llvm/ADT/DepthFirstIterator.h"
//#include "llvm/ADT/SmallPtrSet.h"
//#include "llvm/ADT/SmallVector.h"
//
//
//using namespace llvm;
//
//namespace {
//  struct ADCE : public FunctionPass {
//    static char ID; // Pass identifcation, replacement for typeid
//    ADCE() : FunctionPass(/*(intptr_t)&*/ID) {}
//
//    virtual bool runOnFunction(Function& F);
//
//    virtual void getAnalysisUsage(AnalysisUsage& AU) const {
//      AU.setPreservesCFG();
//    }
//
//  };
//}
//
//char ADCE::ID = 0;
//static RegisterPass<ADCE> X("mp5-adce", "Aggressive Dead Code Elimination (MP5");
//
//bool ADCE::runOnFunction(Function& F) {
//  SmallPtrSet<Instruction*, 128> alive;
//  SmallVector<Instruction*, 128> worklist;
//
//  SmallPtrSet<BasicBlock*, 64> reachable;
//  SmallVector<BasicBlock*, 16> unreachable;
//
//  // First, collect the set of reachable blocks ...
//  for (df_ext_iterator<BasicBlock*, SmallPtrSet<BasicBlock*, 64> >
//       DI = df_ext_begin(&F.getEntryBlock(), reachable),
//       DE = df_ext_end(&F.getEntryBlock(), reachable); DI != DE; ++DI)
//    ; // Deliberately empty, df_ext_iterator will fill in the set.
//
//  // ... and then invert it into the list of unreachable ones.  These
//  // blocks will be removed from the function.
//  for (Function::iterator FI = F.begin(), FE = F.end(); FI != FE; ++FI)
//    if (!reachable.count(FI))
//      unreachable.push_back(FI);
//
//  // Prepare to remove blocks by removing the PHI node entries for those blocks
//  // in their successors, and remove them from reference counting.
//  for (SmallVector<BasicBlock*, 16>::iterator UI = unreachable.begin(),
//       UE = unreachable.end(); UI != UE; ++UI) {
//    BasicBlock* BB = *UI;
//    for (succ_iterator SI = succ_begin(BB), SE = succ_end(BB);
//         SI != SE; ++SI) {
//      BasicBlock* succ = *SI;
//      BasicBlock::iterator succ_inst = succ->begin();
//      while (PHINode* P = dyn_cast<PHINode>(succ_inst)) {
//        P->removeIncomingValue(BB);
//        ++succ_inst;
//      }
//    }
//
//    BB->dropAllReferences();
//  }
//
//  // Finally, erase the unreachable blocks.
//  for (SmallVector<BasicBlock*, 16>::iterator UI = unreachable.begin(),
//       UE = unreachable.end(); UI != UE; ++UI)
//    (*UI)->eraseFromParent();
//
//  // Collect the set of "root" instructions that are known live.
//  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I)
//    if (/*isa<TerminatorInst>(I.getInstructionIterator()) ||*/
//        I->mayWriteToMemory()) {
//      alive.insert(I.getInstructionIterator());
//      worklist.push_back(I.getInstructionIterator());
//    }
//
//  // Propagate liveness backwards to operands.
//  while (!worklist.empty()) {
//    Instruction* curr = worklist.back();
//    worklist.pop_back();
//
//    for (Instruction::op_iterator OI = curr->op_begin(), OE = curr->op_end();
//         OI != OE; ++OI)
//      if (Instruction* Inst = dyn_cast<Instruction>(OI))
//        if (alive.insert(Inst))
//          worklist.push_back(Inst);
//  }
//
//  // The inverse of the live set is the dead set.  These are those instructions
//  // which have no side effects and do not influence the control flow or return
//  // value of the function, and may therefore be deleted safely.
//  // NOTE: We reuse the worklist vector here for memory efficiency.
//  for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I)
//    if (!alive.count(I.getInstructionIterator())) {
//      worklist.push_back(I.getInstructionIterator());
//      I->dropAllReferences();
//    }
//
//  for (SmallVector<Instruction*, 1024>::iterator I = worklist.begin(),
//       E = worklist.end(); I != E; ++I)
//	  (*I)->eraseFromParent();
//
//  return !worklist.empty();
//}
//
//FunctionPass *llvm::createAggressiveDCEPass() {
//  return new ADCE();
//}


#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/Transforms/Utils/UnifyFunctionExitNodes.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/ADT/DepthFirstIterator.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/Pass.h"
#include "llvm/Support/CFG.h"
#include "llvm/Support/InstIterator.h"
#include "llvm/Transforms/Utils/Local.h"
#include <iostream>
using namespace llvm;


namespace {
  //===---------------------------------------------------------------------===//
  // ADCE Class
  //
  // This class does all of the work of Aggressive Dead Code Elimination.
  //
  class ADCE : public FunctionPass {
  private:
    Function *Func;                       // The function that we are working on
	std::vector<Instruction*> WorkList;   // Instructions that just became live
    std::set<Instruction*>    LiveSet;    // The set of live instructions

    //===-------------------------------------------------------------------===//
    // The public interface for this class
    //
  public:
    static char ID; // Pass identification, replacement for typeid
    ADCE() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F) {
      Func = &F;
      bool Changed = doADCE();
      assert(WorkList.empty());
      LiveSet.clear();
      return Changed;
    }

    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.addRequired<UnifyFunctionExitNodes>();
      AU.addRequired<PostDominatorTree>();
      AU.setPreservesCFG();
    }

  private:
    bool doADCE();

    void markLive(Instruction *I) {
        if (!LiveSet.insert(I).second) return;
        WorkList.push_back(I);
      }
  };
}
char ADCE::ID = 0;
RegisterPass<ADCE> X("mp5-adce", "Aggressive Dead Code Elimination (MP5)");
INITIALIZE_PASS(ADCE, "adce", "Aggressive Dead Code Elimination", false, false)


bool ADCE::doADCE()
{

//	  // Initial pass to mark trivially live and trivially dead instructions
//	  // Perform this pass in depth-first order on the CFG so that we never
//	  // visit blocks that are unreachable: those are trivially dead.
//	  // Use df_ext_iterator<BasicBlock*> in order to remember those blocks.
//	  //
//	  LiveSet = emptySet;
//	  for (each BB in F in depth-first order) // use df_ext_iterator<BasicBlock*>
//		  for (each instruction I in BB)
//			  if (isTriviallyLive(I)) // see below
//				  markLive(I, LiveSet, WorkList);
//			  else if (I.use_empty())
//					remove I from BB

	  //For each bb in df order
	 std::set<BasicBlock*> ReachableBBs;
	  for (df_ext_iterator<BasicBlock*>
	         BBI = df_ext_begin(&Func->front(), ReachableBBs),
	         BBE = df_ext_end(&Func->front(), ReachableBBs); BBI != BBE; ++BBI) {
	    BasicBlock *BB = *BBI;
	    //for each instruction I in BB
	    for (BasicBlock::iterator II = BB->begin(), EI = BB->end(); II != EI; ) {
	      Instruction *I = II++;
	      //Check if trivially Live if so markLive
	      if (I->mayWriteToMemory() || isa<ReturnInst>(I) || isa<UnreachableInst>(I)) {
	        markLive(I);
	      }
	      //Else if is trivially dead remove it
	      else if (isInstructionTriviallyDead(I)) {
	    	  //not sure if this is right way to remove
	        BB->getInstList().remove(II);
	      }
	    }
	  }

//	  // Worklist to find new live instructions
//	  while (WorkList is not empty) {
//		  I = get instruction at head of work list;
//		  if (basic block containing I is reachable)
//			  for (all operands op of I)
//				  if (operand op is an instruction)
//					  markLive(op, LiveSet, WorkList);
//	  }
	    std::set<BasicBlock*> AliveBlocks;
	    while (!WorkList.empty()) {
	        Instruction *I = WorkList.back();
	        WorkList.pop_back();

	        BasicBlock *BB = I->getParent();
	        //if basic block containing I is reachable
	        if (!ReachableBBs.count(BB))
	        	continue;
	          for (unsigned op = 0, End = I->getNumOperands(); op != End; ++op)
	            if (Instruction *Operand = dyn_cast<Instruction>(I->getOperand(op)))
	              markLive(Operand);
//	        }
	      }

//	    // Delete all instructions not in LiveSet. Since you may be deleting
//	    // multiple instructions that may be in a def-use cycle, you must call
//	    // I.dropAllReferences() on all of them before deleting any of them
//	    // because you cannot delete a Value that has users.
//	    for (each BB in F in any order) // use F.begin(), F.end()
//			if (BB is reachable)
//				for (each non-live instruction I in BB)
//					I.dropAllReferences();
//				for (each BB in F in any order)
//					if (BB is reachable)
//						for (each non-live instruction I in BB)
//							erase I from BB;


//	    for (Function::iterator BB = Func->begin(), E = Func->end(); BB != E; ++BB)
//	       BB->dropAllReferences();
//
//	    for (std::vector<BasicBlock*>::iterator I = DeadBlocks.begin(),
//	             E = DeadBlocks.end(); I != E; ++I)
//	        Func->getBasicBlockList().erase(*I);
	    return !WorkList.empty();

}

FunctionPass *llvm::createAggressiveDCEPass() {
  return new ADCE();
}



