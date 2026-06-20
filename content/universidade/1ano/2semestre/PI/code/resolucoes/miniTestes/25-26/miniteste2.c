#include <stdio.h>
#include <stdlib.h>

int partition(int x, int v[], int N) {
    int r[N]; 
    int i, m = 0, M = N - 1; 
    for (i = 0; i < N; i++) {
        if (v[i] <= x) {
            r[m++] = v[i];
        } else {
            r[M--] = v[i];
        }
    }
    for (i = 0; i < N; i++) {
        v[i] = r[i];
    }
    return m; 
}

void quickSort(int v[], int N) {
    if (N <= 1) {
        return; 
    }
    int pivote = v[N - 1]; 
    int m = partition(pivote, v, N);
    if (m == N) {
        m--; 
    }
    quickSort(v, m);
    quickSort(v + m, N - m); 
}

int emparelhar (int esq[], int dir[], int N){
    quickSort(esq, N);
    quickSort(dir, N);
    int soma = 0; int i;
    for(i = 0; i < N; i ++){
        int empareje = abs(esq[i] - dir[N - 1 - i]);
        soma += empareje;
    }
    return soma;
}


int main() {
    int esq[60] = {260,3557,1594,3008,1395,968,4113,4530,1006,962,2942,365,2082,4852,767,3821,695,4712,3671,4901,3590,4831,4738,3057,1616,4790,640,679,2335,2006,2972,1098,4095,319,3454,223,2289,1760,3905,1126,1123,4506,813,1770,238,4094,1220,2844,2366,534,226,394,1363,3738,2844,4590,1550,159,3623,4947};
    int dir[60] = {2385,2217,272,539,4247,2385,3496,4885,623,2420,3144,1968,735,4915,1625,3534,1042,1011,4679,4152,244,2295,3818,396,2692,1815,2991,33,2669,4397,4553,547,825,1210,4662,211,3808,3377,2761,625,2335,1868,2995,2776,2767,2439,4874,4331,556,1301,3872,560,94,3984,3755,4789,1407,3015,193,2769};
    int resultado = emparelhar(esq, dir, 60);
    printf("A soma é: %d\n", resultado);    
    return 0;
}