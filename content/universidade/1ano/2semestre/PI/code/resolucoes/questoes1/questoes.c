#include <stdio.h> 

int calc_maior(int size);
int segundo_maior (int size);
int average(int size);
int bitsUm (unsigned int n);
int trailingZ (unsigned int n);
int qDig (unsigned int n);

int main (){
    int x;
    printf("quantos numeros queres\n");
    scanf("%d", &x);

    //1.
    /*int resultado = calc_maior(x);
    printf("a gaita maior é %d\n", resultado);
    return 0; */

    //2.
    /*int media = average(x);
    printf("A media dessa gaita toda é: %d", media);
    return 0; */

    //3.
    /*int resultado = segundo_maior(x);
    printf("O segundo maior e: %d\n", resultado); */
    
    unsigned int numero;
    printf("qual é o teu número?\n");
    scanf("%u", &numero);

    //4. 
    /*int ums = bitsUm(numero);
    printf("O teu número %u tem %d '1' isso são bues\n", numero, resultado);*/

    //5. 
    /*int ceros = trailingZ(numero);
    printf("O seu número %u, acaba em %d ceros binarios.\n", numero, ceros);*/
    
    //6.
    int digitos = qDig(numero);
    printf("O teu número %u precisa de %d digitos para ser representado em base decimal", numero, digitos);
    
    return 0;
}


//1.
int calc_maior(int size){
    int i, j;
    int arr[size];
    printf("oh men lista os números\n");
    for (i = 0; i < size; i ++){
        scanf("%d", &arr[i]);
        if (arr[i] == 0){
            break;
        }
    }
    int maior = arr[0];
    for (j = 1; j < i; j ++)
        if (arr[j] > maior) maior = arr[j];
    return maior;
}

int calc_maior2(){
    int atual, maior;
    printf("lista os numeros (avisas que acabaste usando o número 0)\n");
    scanf("%d", atual);
    maior = atual;
    while (atual != 0){
        if (atual > maior) maior = atual;
        scanf("d%", &atual);
    }
        
    return maior;
}

//2. 
int average(int size){
    int i, j;
    int arr[size];
    printf("oh men lista os números\n");
    for (i = 0; i < size; i ++){
        scanf("%d", &arr[i]);
        if (arr[i] == 0){
            break;
        }
    }
    int soma = 0;
    for (j = 0; j < i; j ++)
        soma += arr[j]; 
    if (i == 0)
        return 0;
    return soma / i;
}

int average2 () {
    int numero; 
    int soma = 0; 
    int contador = 0; 

    printf("oh men lista os numeros (termina em 0)");
    scanf("%d", numero);
    while (numero != 0){
        soma += numero;
        contador++;
        scanf("%d", &numero);
    }
    if (contador == 0) {
        return 0;
    }
    return soma / contador;
}

//3. 
int segundo_maior (int size) {
    int i, j;
    int arr[size];
    printf("oh men lista os números\n");
    for (i = 0; i < size; i ++){
        scanf("%d", &arr[i]);
        if (arr[i] == 0){
            break;
        }
    }
    int maior, seg_maior;
    if (arr[0] > arr[1]){
        maior = arr[0];
        seg_maior = arr[1];
    }
    else {
        maior = arr[1];
        seg_maior = arr[0];
    }
    for (j = 2; j < i; j ++){
        if (arr[j] > maior){
            seg_maior = maior;
            maior = arr[j];
        }
        else if (arr[j] > seg_maior && arr[j] != maior){
            seg_maior = arr[j];
        }
    }
    return seg_maior;
}

int segundo_maior2() {
    int numero;
    int maior = 0; 
    int seg_maior = 0;
    printf("Escribe los números (termina con 0):\n");
    scanf("%d", &numero);
    while (numero != 0) {
        if (numero > maior) {
            seg_maior = maior; 
            maior = numero;   
        }
        else if (numero > seg_maior) {
            seg_maior = numero;
        }
        scanf("%d", &numero);
    }
    return seg_maior;
}

//4. 
int bitsUm (unsigned int n){
    int contador = 0;
    while (n > 0){
        if (n % 2 == 1){
            contador++;
        }
        n = n / 2;
    }
    return contador;
}

//5. 
int trailingZ (unsigned int n){
    if (n == 0) return 32; 
    int contador = 0; 
    while (n % 2 == 0){
        contador++;
        n = n / 2;
    }
    return contador;
}

//6. 
int qDig (unsigned int n){
    int digitos; 
    if (n == 0) return 1;
    while (n > 0){
        n++;
        n = n / 10;
    }
    return digitos;
}

//7.
char *strcat (char s1[], char s2[]){
    int i, j;
    for (i = 0; s1[i] != '\0'; i ++);
    for (j = 0; s2[j] != '\0'; j ++)
        s1[i++] = s2[j]; 
    s1[i] = '\0';
    return s1;
}

//8. 
char *strcpy (char *dest, char source[]){
    int i;
    for (i = 0; source[i] != '\0'; i ++){
        dest[i] = source[i];
    }
    dest[i] = '\0';
    return dest;
}

//9. 
int strcmp (char s1[], char s2[]){
    int i = 0;
    while (s1[i] == s2[i] && s1[i] != '\0')
        i ++;
    return (s1[i] - s2[i]);
}

//10. 
char *strstr (char s1[], char s2[]){
    int i = 0, j = 0;
    for (i = 0; s1[i] != '\0'; i ++){
        j = 0;
        while (s1[i + j] == s2[j] && s2[j] != '\0')
            j ++;
        if (s2[j] == '\0')
            return s1 + i; // ou &s1[i] 
    }
    return NULL;
}

//11. 
void strrev (char s[]){
    int i = 0, inicio = 0, fim;
    while (s[i] != '\0')
        i ++;
    int fim = i - 1;
    while (inicio < fim){
        char temp;
        temp = s[inicio];
        s[inicio] = s[fim];
        s[fim] = temp;
        inicio ++;
        fim --;
    }
}

//12. 
int eVogal (char c){
    if (c >= 'a' && c <= 'z') 
        c = c + 'A' - 'a';
    return (c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U');
}

void strnoV (char s[]){
    int i, j = 0;
    for (i = 0; s[i] != '\0'; i ++)
        if (! eVogal(s[i])) s[j++] = s[i];
    s[j] = '\0';
}

//13. 
void truncW (char t[], int n){
    int i, j = 0, contador = 0;
    for (i = 0; t[i] != '\0'; i ++){
        
        if (t[i] == ' '){
            t[j++] = t[i];
            contador = 0;
        } else {
            if (contador < n) {
                t[j++] = t[i]; 
                contador ++;
            }
        }
    }
    t[j] = '\0';
}

//14.
char charMaisFreq (char s[]){

}