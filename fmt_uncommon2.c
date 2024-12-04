#include <stdio.h>
#include <stdlib.h>

int main() {

   /*
      https://nixhacker.com/case-of-format-string-in-64-bit-is-it-still-critical
      A partir du 5ième affichage, on commence à lire les données sur le stack
      Les données sur le stack vont commencer après adresse de retour
      exemple:
      dans __printf
      
      (gdb) x/32wx $rsp
      0x7fffffffdc88: 0x555551cd      0x00005555      0x00000071      0x0000002e
      0x7fffffffdc98: 0x00000005      0x00000007      0x00000001      0x00000000
      0x7fffffffdca8: 0xf7ddbd68      0x00007fff      0xffffdda0      0x00007fff

      celle-ci commence par 2e00000071
   */
   int A = 5, B = 7, count_one, count_two;

   // Example of a %n format string
   printf("The number of bytes written up to this point X%n is being stored in count_one, and the number of bytes up to here X%n is being stored in count_two.\n", &count_one, &count_two);

   printf("count_one: %d\n", count_one);
   printf("count_two: %d\n", count_two);

   // Stack Example
   printf("A is %d and is at %p.  B is %x. test is %p en plus %p, 6ième %p, 7ième %p, 8ième %p, 9ième %p, 10ième %p\n", A, &A);

   exit(0);
}	
