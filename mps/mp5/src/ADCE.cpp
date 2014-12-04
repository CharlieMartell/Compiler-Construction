#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/Transforms/Utils/UnifyFunctionExitNodes.h"
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
    
    // Execute the Aggressive Dead Code Elimination Algorithm
    //
    virtual bool runOnFunction(Function &F) {
      Func = &F;
      bool Changed = doADCE();
      assert(WorkList.empty());
      LiveSet.clear();
      return Changed;
    }
    
    // getAnalysisUsage //
    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
      // We require that all function nodes are unified, because otherwise code
      // can be marked live that wouldn't necessarily be otherwise.
      AU.addRequired<UnifyFunctionExitNodes>();
      AU.addRequired<PostDominatorTree>();
      AU.setPreservesCFG();
    }
    
  private:
    // doADCE() - Run the Aggressive Dead Code Elimination algorithm, returning
    // true if the function was modified.
    //
    bool doADCE();
  };
  
  char ADCE::ID = 0;
  RegisterPass<ADCE> X("mp5-adce", "Aggressive Dead Code Elimination (MP5)");
}  // End of anonymous namespace

// Implement ADCE algorithm here
bool ADCE::doADCE()
{
  return false;
}
