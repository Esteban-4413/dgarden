#include<stdio.h>

void linha_horizontal(int espacos, int hashtags){
    int x; 
    for (x = 0; x < espacos; x ++){
        putchar(' ');
    }    
    for (x = 0; x < hashtags; x ++) {
        putchar('#');
    }
    putchar('\n');
}



void triangulo(int n) {
    int i;
    for (i = 1; i <= n; i ++){
        int calc_espacos = n - i; 
        int calc_hashtags = 2 * i - 1; 
        linha_horizontal(calc_espacos, calc_hashtags);
    }
}