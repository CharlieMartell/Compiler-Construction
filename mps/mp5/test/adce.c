#include <stdio.h>

int main()
{
  long i, a, b, sum=0, A[100];

  for (i=0; i < 100; ++i)
    A[i] = i;

  a = A[0];				/* delete dead load */
  b = A[0];

  for (i=0; i < 100; ++i) {
    sum += A[i];
    if (sum < b)
	  a = a * sum;		/* def and use of a: Aggressive DCE deletes this */
    else
	  b = b * sum;
  }

  printf("b = %ld\n", b);
  return 0;

  a = a + 5;			/* delete unreachable code */
  printf("Should not get here!");
} 
