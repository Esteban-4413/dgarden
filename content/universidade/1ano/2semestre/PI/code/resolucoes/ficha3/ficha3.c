#include <stdio.h> 

int swapM (int *x, int *y);
void swap (int v[], int i, int j);
int soma (int v[], int N);
void inverteArray1 (int v[], int N);
void inverteArray2 (int v[], int N);
int maximum (int v[], int N, int *m);
void quadrados (int q[], int N);
void quadrados2 (int q[], int N);
void pascal(int p[], int n);

int main(){
    //.2
    /*int x = 3, y = 5;
    swapM(&x, &y);
    printf("%d %d\n", x, y);*/
    
    return 0;
}

// 2. 
int swapM (int *x, int *y){
    int empty; 
    empty = *x; 
    *x = *y;
    *y = empty; 
}

// 3. 
void swap (int v[], int i, int j){
    int empty; 
    empty = v[i];
    v[i] = v[j];
    v[j] = empty;
}

// 4. 
int soma (int v[], int N){
    int i = 0, resultado = 0; 
    while (i < N){
        resultado += v[i];
        i ++; 
    }
    return resultado;
}

// 5.
void inverteArray1 (int v[], int N){
    int inicio = 0;
    int fim = N -1;
    while (inicio < fim){
        swap(v, inicio, fim);
        inicio ++;
        fim --;
    }
} 

void inverteArray2 (int v[], int N){
    int inicio = 0;
    int fim = N -1;
    while (inicio < fim){
        swapM(&v[inicio], &v[fim]);
        inicio ++;
        fim --;
    }
}

// 6.
int maximum (int v[], int N, int *m){
    int i;
    if (N <= 0){
        return 1;
    }
    *m = v[0];
    for (i = 1; i < N; i ++){
        if (v[i] > *m) {
            *m = v[i];
        }
    }
    return 0;
}

// 7. 
void quadrados (int q[], int N){
    int i; 
    for (i = 0; i < N; i++){
        q[i] = q[i - 1] + (2 * (i - 1) + 1);
    }
}

void quadrados2 (int q[], int N){
    q[0] = 0;
    int i; 
    int impar = 1;
    for(i = 1; i < N; i++){
        q[i] = q[i - 1] + impar;
        impar += 2;
    }
}

//8. 
void pascal(int p[], int n){
    int i, j;
    p[0] = 1;
    for(i = 0; i < n; i ++){
        p[i + 1] = 1;
        for(j = i; j >= 1; j--)
            p[j] = p[j] + p[j - 1];
    }
}

