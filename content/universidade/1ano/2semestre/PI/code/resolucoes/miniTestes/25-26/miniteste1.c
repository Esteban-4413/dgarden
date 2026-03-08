#include <stdio.h>

int primo (int n);
int mdc(int numero);

int main() {

    //1. 
    int inicio = 2214566;
    int fim = 2314583; 
    int contador = 0;
    for (int i = inicio; i <= fim; i++) {
        if (primo(i)) {
            contador++; 
        }
    }
    printf("%d\n", contador);


   //2.
    int josejoaquina = 36714908;
    int resultado = mdc(josejoaquina);
    printf(" %d\n", resultado);
    return 0;
}



// 1. 
int primo(int n) {
    int i;
    if (n <= 1) return 0;    
    for (i = 2; i * i <= n; i++) {
        if (n % i == 0) {
            return 0; 
        }
    }
    return 1; 
}



// 2. 

int mdc(int numero){
    int i;
    int max_primo = 0;

    for (i = 1; i <= numero / 2; i ++){
        if (numero % i == 0) {
            if(primo(i) == 1){
                max_primo = 1;
            }
        }
    }
    if (primo(numero) == 1) max_primo = numero;
    return max_primo;
}
