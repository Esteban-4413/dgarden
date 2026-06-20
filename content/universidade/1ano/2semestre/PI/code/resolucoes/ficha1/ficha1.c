#include <stdio.h>


void cuadrado(int n); // exercicio 3.1
void linha(int n);

void linhas_xadrez(int n); // exercicio 3.2
void xadrez(int n); 
void xadrez2(int n);

int elipse(int a, int b);

int main() {
    int l;
    scanf("%d", &l);
    //cuadrado(5); 
    //xadrex(5);
    //xadrez2(l);
    elipse(8, 4);

    return 0 ; 
}


// 3. Programas iterativos
 

/*
1. Escreva um programa que desenha no ecra (usando o caracter '#') um quadrado de
dimensão 5. O resultado da invocação da função com um argumento 5 deverá ser 
#####
#####
#####
#####
#####
 */

void linha(int y) {
    int x; 
    for (x = 1; x <= y; x ++) {
        putchar('#');
    }
    putchar('\n');
}

void cuadrado(int n) {
    int x, y; 
    for (x = 1; x <= y; x ++) {
        linha(n); 
    }
} 

/*
2. Escreva um programa que desenhe no ecrã (usando os caracteres #) um tabuleiro
de xadrez. O resultado da invoacção dessa função com um argumento 5 devera ser
#_#_# 
_#_#_ 
#_#_# 
_#_#_ 
#_#_#
*/


void linhas_xadrez(int n) {
    int x; 
    for (x = 1; x <= n; x ++) {
        if (x + n % 2 == 0) putchar('_'); 
        else putchar('#'); 
    }
    putchar('\n');
}

void xadrez(int n) {
    int x;
    for (x = 1; x <= n; x ++) {
        linhas_xadrez(n);
    }       
}

void xadrez2 (int n) {
    int l, c; 
    for (l = 0; l <n; n ++){
        for (c = 0; c < n; c ++){
            if (l + c % 2 == 0)
                putchar('#');
            else putchar(' ');
        }
        putchar('\n');
    }

}

/* 
4. Escreva um programa que desenhe no ecrã (usando os carateres #) um circulo. O
prgrama deverá começar por ler o raio do circulo pretendido. O resultado para um valor
de raio 4 deverá ser 
    # 
  ##### 
 ####### 
 ####### 
######### 
 ####### 
 ####### 
  ##### 
    #
Faça com que a função que desenha um ciruclo retorne o número de '#' impressos, e
inspeccione os resultados obtidos em algumas experiências.
*/

int circulo(int r) {
    int x, y; 
    int contador = 0;
    for (y = r; y >= -1 * r; y --){
        for (x = (-1) * r; x <= r; x ++){
            if (x * x + y * y <= r * r){
                putchar ('#');
                contador ++;
            }
            else putchar(' ');
        }
        putchar('\n');
    }
    return contador;
}

int elipse(int a, int b) {
    int x, y;
    int contador = 0; 
    for (y = b; y >= - b; y --) {
        for (x = -a; x <= a; x ++){
            if ((x * x * b * b) + (y * y * a * a) <= (a * a * b * b)) {
                putchar('#');
                contador++;
            } 
            else {
                putchar(' ');
            }
        }
        putchar('\n');
    }
    return contador;
}