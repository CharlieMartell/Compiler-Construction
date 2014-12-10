int foo(int x) {
  int y = x * x;
  return x;
}

int bar(int x) {
  int y = x * x;
  return 0;
 l0:
  goto l1;
 l1:
  y = y * x;
  goto l1;
}

