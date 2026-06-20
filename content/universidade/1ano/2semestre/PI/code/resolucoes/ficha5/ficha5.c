#include <stdio.h>
#include <string.h>

typedef struct aluno{
  int numero;
  char nome[100];
  int miniT[6];
  float teste;
} Aluno;

void dumpV (int v[], int N){
    int i;
    for (i=0; i<N; i++) printf ("%d ", v[i]);
}

int nota (Aluno a){
  int i, r = 0;
  float m = 0;
  for(i = 0; i < 6; i++) m += a.miniT[i];
  if(m >= 8){
    m = m * 0.2 + a.teste * 0.8;
    if(m >= 9.5) r = (int) (m + 0.5);
  }
  return r;
}

int procuraNum(int num, Aluno t[], int N){
  int r = -1, i = 0, s = N - 1, m;
  while(r == -1 && i <= s){
    m = (i + s) / 2;
    if(t[m].numero == num) r = m;
    else if(t[m].numero > num) s = m - 1;
    else i = m + 1;
  }
  return r;
}

void swapA(Aluno v[], int i, int j){
  Aluno x = v[i];
  v[i] = v[j];
  v[j] = x;
}

void ordenaPorNum(Aluno t[], int N){
  int i, j;
  for(i = N; i > 0; i --){
    for(j = 0; j < N - 1; j++){
      if(t[j].numero > t[j + 1].numero) swapA(t, j, j + 1);
    }
  }
}

void criaIndPorNum(Aluno t[], int N, int ind[]){
  int i, j;
  for(i = 0; i < N; i++) ind[i] = i;
  for(i = 0; i < N; i++){
    for(j = 0; j < N - 1 - i; j++){
      if(t[ind[j]].numero > t[ind[j + 1]].numero){
        int temp = ind[j];
        ind[j] = ind[j + 1];
        ind[j + 1] = temp;
      }
    }
  }
}

void imprimeAluno(Aluno a){
  printf("{");
  printf("%d, ", a.numero);
  printf("\"%s\", ", a.nome);
  printf("{");
  for(int i = 0; i < 6; i ++) printf("%d, ", a.miniT[i]);
  printf("}, ");
  printf("%2f, ", a.teste);
  int n = nota(a);
  printf("%d", n);
  printf("}\n");
}

void imprimeTurma(int ind[], Aluno t[], int N){
  int i = 1;
  printf("{");
  imprimeAluno(t[0]);
  while(i < N){
    printf(",");
    imprimeAluno(t[ind[i]]);
    i++;
  }
  printf("}");
}

// recebemos um array de alunos e um array de indices correspondente à ordenação do array de alunos por ordem crescente do número de aluno
int procuraNumInd(int num, int ind[], Aluno t[], int N){
  int r = -1, i = 0, s = N - 1;
  while(r == -1 && i <= s){
    int m = (i + s)/2;
    if(t[ind[m]].numero == num) r = m;
    else if(t[ind[m]].numero < num) i = m + 1;
    else s = m - 1; 
  }
  return r;
}

void criaIndPorNome(Aluno t[], int N, int ind[]){
  int i, j, flag = 1;
  for(i = 0; i < N; i++) ind[i] = i;
  for(i = 0; i < N && flag; i++){
    flag = 0;
    for(j = 0; j < N - 1 - i; j++){
      if(strcmp(t[ind[j]].nome, t[ind[j + 1]].nome) > 0){
        int temp = ind[j];
        ind[j] = ind[j + 1];
        ind[j + 1] = temp;
        flag = 1;
      }
    }
  }
}

void imprimeAluno1 (Aluno *a){
    int i;
    printf ("%-5d %s (%d", a->numero, a->nome, a->miniT[0]);
    for(i=1; i<6; i++) printf (", %d", a->miniT[i]);
    printf (") %5.2f %d\n", a->teste, nota(*a));
}

int main() {
    Aluno Turma1 [7] = {{4444, "André", {2,1,0,2,2,2}, 10.5}
                       ,{3333, "Paulo", {0,0,2,2,2,1},  8.7}
                       ,{8888, "Carla", {2,1,2,1,0,1}, 14.5}
                       ,{2222, "Joana", {2,0,2,1,0,2},  3.5}
                       ,{7777, "Maria", {2,2,2,2,2,1},  5.5}
                       ,{6666, "Bruna", {2,2,2,1,0,0}, 12.5}
                       ,{5555, "Diogo", {2,2,1,1,1,0},  8.5}
                       } ;
    int indNome [7], indNum [7];
    int i;
    
    printf ("\n-------------- Testes --------------\n");
    
    ordenaPorNum (Turma1, 7);

    printf ("procura 5555: %d \n", procuraNum (5555, Turma1, 7));
    printf ("procura 9999:%d \n", procuraNum (9999, Turma1, 7));

    for (i=0; i<7; imprimeAluno1 (Turma1 + i++));

    criaIndPorNum (Turma1, 7, indNum);

    criaIndPorNome (Turma1, 7, indNome);

    imprimeTurma (indNum, Turma1, 7);
    imprimeTurma (indNome, Turma1, 7);

    printf ("procura 5555:%d \n",  procuraNumInd (5555, indNum, Turma1, 7));
    printf ("procura 9999:%d \n",  procuraNumInd (9999, indNum, Turma1, 7));

    printf ("\n---------- Fim dos Testes ----------\n");

    return 0;
}
