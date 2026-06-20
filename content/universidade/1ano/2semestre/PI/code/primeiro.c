#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 
int main(void)
{
  int nota = 0;
  srand(100);
  printf("Numero aleatorio: %d |", rand()); 
  printf("Numero aleatorio: %d |", rand()); 
  printf("Numero aleatorio: %d |", rand()); 
  srand(time(NULL));
  nota = 8 + rand() % 13;
 
  printf("Eu vou tirar boa nota a PI: %d\n", nota);
  return 0;
}