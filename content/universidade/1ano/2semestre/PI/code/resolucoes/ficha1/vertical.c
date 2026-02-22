#include<stdio.h>

void linhas_triangulo(int n);
void metade_crescente(int n);
void metade_decrescente(int n);
void triangulo(int n);

void metade_crescente(int n) {
    int x, y;
    for(x = 1; x <= n; x ++) {
        linhas_triangulo(x);
    }
}

void metade_decrescente(int n) {
    int x; 
    for (x = n - 1; x >= 1; x --){
        linhas_triangulo(x);
    }
}

void linhas_triangulo(int n){
    int y ; 
    for (y = 1; y <= n; y ++){
        putchar('#'); 
    }
    putchar('\n');
}

void triangulo(int n){
    metade_crescente(n);
    metade_decrescente(n);
}