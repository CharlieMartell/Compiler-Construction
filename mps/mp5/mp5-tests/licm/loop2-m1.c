#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  int x, i, j;
  x = 0;
  for (i = 0; i < 10; ++i) {
    for (j = 0; j < 10; ++j) {
      x = 10+i;
    }
  }
  printf("%d\n", x);
  return 0;
}
