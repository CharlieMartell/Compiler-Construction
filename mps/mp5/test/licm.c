#include "stdio.h"
#include "stdlib.h"

typedef struct {
  int e;
  int f;
} twoInt;

twoInt i2;

int main(int argc, char** argv)
{
  if (argc < 5) { fprintf(stderr, "USAGE: licm a b c d\n"); exit(1); }
  int a=atoi(argv[1]);
  int b=atoi(argv[2]);
  int c=atoi(argv[3]);
  int d=atoi(argv[4]);
  int x;

  int i,j;

  i2.e=a;
  i2.f=b;

  for (j=0; j < b; j++)
  {
    for (i=0; i < c; i++)
    {
      a = (c/b) + b*j;    /* b*j out of one loop; c/b stays because div traps */
      x = b*j + i2.e;     /* don't move because of load for i2.e */
      if (j==i)
        d=a*c;            /* d does not dominate loop exit */
      a = a-c;            /* move out to same level as previous "a = ..." */
    }
    i2.f=b+c;             /* don't move store for i2.f */
  }

  printf("%d %d %d %d %d %d %d\n", a, b, c, d, x, i2.e, i2.f);
}
