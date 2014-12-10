int foo(int x) {
  int y,z;
start:
  y = x + 10;
  return 0;
  z = y + 10;
  goto start;
}
