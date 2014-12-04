#include "llvm/IR/Function.h"
#include "llvm/Analysis/Dominators.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Transforms/Scalar.h"
#include <iostream>

using namespace llvm;

namespace {
  class LICM : public LoopPass {
  private:
    Loop *curLoop;
    
  public:
    static char ID; // Pass identification, replacement for typeid
    LICM() : LoopPass(ID) {}
    virtual bool runOnLoop(Loop *L, LPPassManager &LPM) {
	curLoop = L;
	return doLICM();
    }
    
    /// This transformation requires natural loop information & requires that
    /// loop preheaders be inserted into the CFG...
    ///
    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.setPreservesCFG();
      AU.addRequiredID(LoopSimplifyID);
      AU.addRequired<LoopInfo>();
      AU.addRequired<DominatorTree>();
    }
    
  private:
    bool doLICM();
  };
}

char LICM::ID = 0;
RegisterPass<LICM> X("mp5-licm", "Loop Invariant Code Motion (MP5)");

// Implement LICM algorithm here
bool LICM::doLICM()
{
  return false;
}
