//Inclde basically all of llvm -_-
#include "llvm/Pass.h"
#include "llvm/Support/CFG.h"
#include "llvm/Support/InstIterator.h"
#include "llvm/PassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/Analysis/Dominators.h"
#include "llvm/IR/Module.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Analysis/ConstantFolding.h"
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Scalar.h"
#include <map>
#include <set>
#include <vector>
#include <ostream>
#include <fstream>
#include <iostream>

 using namespace llvm;
 using namespace std;

 namespace
 {
   class LICM : public LoopPass {
   public:
     static char ID;
     LICM() : LoopPass(ID) {}

     private:
     bool changed;
     LoopInfo* LI;
     DominatorTree* DT;
     Loop* curLoop;
     BasicBlock *Preheader;

     virtual bool runOnLoop(Loop *L, LPPassManager &LPM) {
        curLoop=L;
        return doLICM();
     }
     virtual bool doLICM(){
//    	 LICM(L)
//    	 {
//			 // Each Loop object also gives you a preheader block for the loop.
//			 for (each basic block BB dominated by loop header,
//			 in preorder on dominator tree) {
//				 if (BB is immediately within L) { // not in an inner loop or outside L
//					 for (each instruction I in BB) {
//						 if (isLoopInvariant(I) && safeToHoist(I))
//							 move I to pre-header basic block;
//					 }
//				 }
//			 }
//    	 }
    	 LI = &getAnalysis<LoopInfo>();
		 DT = &getAnalysis<DominatorTree>();
		 Preheader = curLoop->getLoopPreheader();
		 if (Preheader)
			HoistRegion(DT->getNode(curLoop->getHeader()));
		return false;
     }

     virtual void getAnalysisUsage(AnalysisUsage &AU) const {
       AU.setPreservesAll();
       AU.addRequired<LoopInfo>();
       AU.addRequired<DominatorTree>();
       AU.addRequiredID(LoopSimplifyID);
     }
     bool check_safe_to_hoist(Instruction &Inst){
         if (!isa<BinaryOperator>(Inst) && !isa<CastInst>(Inst)
        		 && !isa<SelectInst>(Inst) && !isa<GetElementPtrInst>(Inst)
				 && !isa<CmpInst>(Inst) &&!isa<InsertElementInst>(Inst)
				 && !isa<ExtractElementInst>(Inst) && !isa<ShuffleVectorInst>(Inst)
				 && !isa<ExtractValueInst>(Inst) && !isa<InsertValueInst>(Inst))
        	 return false;
        if (llvm::isSafeToSpeculativelyExecute(&Inst))
          return true;
        return check_executed(Inst);
     }
   bool check_executed(Instruction &I){
     if (I.getParent() == curLoop->getHeader())
       return true;
     SmallVector<BasicBlock*, 8> ExitBlocks;
     curLoop->getExitBlocks(ExitBlocks);
     for (unsigned i = 0, e = ExitBlocks.size(); i != e; ++i)
       if (!DT->dominates(I.getParent(), ExitBlocks[i]))
         return false;
     if (ExitBlocks.empty())
       return false;
     return true;
   }
   void HoistRegion(DomTreeNode *N) {
        BasicBlock *BB = N->getBlock();
        if (!curLoop->contains(BB)) return;
        if (!(LI->getLoopFor(BB) != curLoop))
          for (BasicBlock::iterator II = BB->begin(), E = BB->end(); II != E; ) {
            Instruction &I = *II++;
          if (Constant *C = ConstantFoldInstruction(&I)){
             I.replaceAllUsesWith(C);
             I.eraseFromParent();
             continue;
          }
          if (check_invariance(&I) && check_safe_to_hoist(I)){
        	  I.moveBefore(Preheader->getTerminator());
        	  changed = true;
          }
       }
       const std::vector<DomTreeNode*> &Children = N->getChildren();
       for (unsigned i = 0, e = Children.size(); i != e; ++i)
         HoistRegion(Children[i]);
   }

  bool check_invariance(Instruction* I){
   for (unsigned i = 0, e = I->getNumOperands(); i != e; ++i)
     if (!check_invariance_helper(I->getOperand(i)))
       return false;
   return true;
  }

  bool check_invariance_helper(Value *V) const{
   if (Instruction *I = dyn_cast<Instruction>(V))
     return !curLoop->contains(I);
   return true;
  }
 };
char LICM::ID = 0;
RegisterPass<LICM> X("mp5-licm", "Loop Invariant Code Motion (MP5");
}
