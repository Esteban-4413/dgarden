#include <stdio.h>

//1. Strings

int isVogal(char c){
  return (c == 'a' || c == 'A' ||
          c == 'e' || c == 'E' ||
          c == 'i' || c == 'I' ||
          c == 'o' || c == 'O' ||
          c == 'u' || c == 'U')
}

int contaVogais(char *s){
  int i = 0, conta = 0;
  while (s[i] != '\0'){
    if(isVogal(s[i])) conta++;
    i++;
  }
  return conta;
}

int retiraVogaisRep(char *s){
  int i = 0, j = 0;
  while(s[i] != '\0'){
    s[j] = s[i];
    j++;
    if(isVogal(s[i])){
      while(s[i + 1] == s[i]) i++;
    }
  }
  s[j] = '\0';
  return (i - j);
}

int duplicaVogais(char *s){
  int i = 0, conta = 0;
  while(s[i] != '\0'){
    if(isVogal(s[i])){
      conta++;
      int j = strlen(s);
      while(j > i){
        s[j + 1] = s[j]; 
        j--;
      }
      s[i + 1] = s[i];
      i++;
    }
    i++;
  }
  return conta;
}

//2. Arrays ordenados

int ordenado (int v[], int N){
  int i = 0;
  while(i < N - 1){
    if(v[i] > v[i + 1]) return 0;
    else i++;
  }
  return 1;
}

void merge(int a[], int na, int b[], int r[]){
  int ia, ib, ir;
  for(ia = ib = ir = 0; ia < na && ib < nb; ir++){
    r[ir] = (a[ia] < b[ib]) ?  a[ia++] : b[ib++];
  }
  for(; ia < na; r[ir++] = a[ia++]);
  for(; ib < nb; r[ir++] = b[ib++]);
}

// Usando array aux:

// int partition(int v[], int N, int x){
//   int r[N];
//   int i, m = 0, M = N-1;
//   for(i = 0; i < N; i++){
//     (v[i] <= x) ? (r[m++] = v[i]) : r[M--] = v[i]; 
//   }
//   for(i = 0; i < N; i++) v[i] = r[i];
//   return m;
// }
//

// sin usar array aux (in-place def):
int partition(int v[], int N, int x){
  int i = 0, j, temp;
  for(j = 0; j < N; j++){
    if(v[j] <= x){
      temp = v[i];
      v[i] = v[j];
      v[j] = temp;
      i++;
    }
  }
  return i;
}




int main()
{
//     char s1 [100] = "Estaa e umaa strin coom duuuplicadoos";
//     int x;
//
//     printf ("Testes\n");
//     printf ("A strin \"%s\" tem %d voais\n", s1, contaVogais (s1));
//
//     x = retiraVogaisRep (s1);
//     printf ("Foram retiradas %d vogais, resultando em \"%s\"\n", x, s1);
//
//     x = duplicaVogais (s1);
//     printf ("Foram acrescentadas %d vogais, resultando em \"%s\"\n", x, s1);
//
//     printf ("\nFim dos testes\n");
//
//     return 0;

// strings

    int a [15] = {10, 3,45,56, 8,23,13,42,77,31,18,88,24,45, 1},
        b [10] = { 4,12,34,45,48,52,61,73,84,87}, 
        c [10] = { 1, 3, 8,22,33,35,38,41,44,49}, 
        d [50];
    int x;
    
    printf ("Testes\n\n");

    printf ("O array "); dumpV(a,15);
    simNao (ordenado (a,15)); printf (" está ordenado\n");
    printf ("O array "); dumpV(b,10);
    simNao (ordenado (b,10)); printf (" está ordenado\n");
    
    printf ("\n\nMerge dos arrays "); dumpV (b,10);
    printf ("\ne                "); dumpV (c,10); 
    merge (b, 10, c, 10, d);
    printf ("\nresulta em       "); dumpV (d,20);

    printf ("\n\n\nA partição do array  "); dumpV (a,15);
    printf ("\nusando 30 resulta em "); 
    x = partition (a,15,30); 
    dumpV (a,15); printf (" e retorna %d \n", x);

    printf ("\nFim dos testes\n");
    return 0;
}
