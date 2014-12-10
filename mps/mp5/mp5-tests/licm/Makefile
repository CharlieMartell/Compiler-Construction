CC = clang
OPT = opt -load ../../src/Debug+Asserts/lib/MP5.so

OPTS = -mp5-licm

%.ll: %.c
	$(CC) -c -O0 -emit-llvm $< -o - | opt -mem2reg -constprop -S > $@

# Run the optimizations specified in OPTS
%-opt.ll: %.ll
	$(OPT) $(OPTS) -S < $< > $@

clean :
	rm -f *-opt.ll
