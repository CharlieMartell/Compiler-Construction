CC = clang
OPT = opt -load ../src/Debug+Asserts/lib/MP5.so

# Change this to run whatever optimization passes you want
OPTS = -simplifycfg -instcombine -inline -globaldce -instcombine -simplifycfg -mp5-adce -scalarrepl -mem2reg -mp5-adce -verify -sccp -adce -mp5-licm -instcombine -dce -simplifycfg -deadargelim -globaldce
OPTS2 = -simplifycfg -instcombine -inline -globaldce -instcombine -simplifycfg -adce -scalarrepl -mem2reg -mp5-adce -verify -sccp -adce -licm -instcombine -dce -simplifycfg -deadargelim -globaldce

# Make a .ll file from a .bc file, using llvm-dis
%.ll: %.bc
	llvm-dis < $< > $@

# Make a .bc file from a .c file by running through clang, with
# optimizations turned off, and then running a few basic
# optimizations.
%.bc: %.c
	$(CC) -c -O0 -emit-llvm $< -o - | opt -globaldce -mem2reg -instcombine -constprop  > $@

# Run the optimizations specified in OPTS
%-opt.bc: %.bc
	$(OPT) $(OPTS) < $< > $@

%-opt-theirs.bc: %.bc
	$(OPT) $(OPTS2) < $< > $@

clean :
	rm -f *.bc *.ll