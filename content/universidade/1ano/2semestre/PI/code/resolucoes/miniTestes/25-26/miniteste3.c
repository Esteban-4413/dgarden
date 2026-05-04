#include <stdio.h>
#include <stdlib.h>

// El struct exacto del examen
typedef struct message {
    int value;
    int timestamp;
    struct message *next;
} *LLig;

void cleanMessages(LLig *l) 
{
    LLig atual = *l;
    while (atual != NULL) 
    {
        LLig ant = atual;
        LLig corredor = atual->next;
        while (corredor != NULL) 
        {
            if (corredor->value == atual->value) 
            {
                if (corredor->timestamp > atual->timestamp)  atual->timestamp = corredor->timestamp;
                ant->next = corredor->next;
                free(corredor);
                corredor = ant->next;
            } 
            else 
            {
                ant = corredor;
                corredor = corredor->next;
            }
        }
        atual = atual->next;
    }
}

long long somaCubos(LLig l) 
{
    long long soma = 0;
    while (l != NULL) 
    {
        long long ts = l->timestamp;
        soma += (ts * ts * ts);
        l = l->next;
    }
    return soma;
}

void append(LLig *l, int v, int t) 
{
    while (*l != NULL) l = &((*l)->next);
    *l = malloc(sizeof(struct message));
    (*l)->value = v;
    (*l)->timestamp = t;
    (*l)->next = NULL;
}



struct ticket {
    int arrivalTime;
    int timeToSolve;
    int premiumCustomer;
};

int main() {
    // El array completo de tu problema
    struct ticket tickets[] = { 
        {2, 5, 1}, {6, 2, 0}, {11, 4, 0}, {14, 9, 0}, {19, 7, 0}, {21, 2, 1}, 
        {22, 3, 1}, {25, 9, 1}, {29, 8, 1}, {30, 4, 1}, {31, 5, 1}, {32, 1, 1}, 
        {34, 4, 1}, {36, 5, 1}, {38, 1, 1}, {40, 3, 1}, {42, 2, 1}, {44, 3, 0}, 
        {46, 5, 1}, {49, 4, 0}, {51, 3, 1}, {52, 6, 0}, {53, 5, 1}, {55, 2, 0}, 
        {57, 1, 1}, {59, 6, 0}, {61, 4, 0}, {64, 6, 1}, {65, 4, 0}, {66, 2, 1}, 
        {69, 5, 0}, {71, 1, 1}, {73, 1, 0}, {76, 4, 1}, {77, 6, 0}, {78, 4, 1}, 
        {85, 1, 1}, {94, 3, 1}, {109, 1, 1}, {124, 5, 1}, {134, 6, 1}, {147, 1, 0}, 
        {155, 6, 1}, {163, 6, 0}, {174, 1, 0}, {186, 2, 1}, {188, 1, 0}, {190, 3, 0}, 
        {192, 4, 0}, {193, 2, 0} 
    };
    
    int n = 50;
    int handled[50] = {0}; // Array para marcar los tickets ya resueltos (0 = no, 1 = sí)
    
    int currentTime = 0;
    int maxServiceTime = 0;
    int ticketsHandled = 0;

    // Mientras queden tickets por atender...
    while (ticketsHandled < n) {
        int selected = -1;
        int foundPremium = -1;
        int foundRegular = -1;

        // 1. Mirar quién está en la sala de espera en este momento
        for (int i = 0; i < n; i++) {
            // Si no ha sido atendido y ya llegó al sistema...
            if (!handled[i] && tickets[i].arrivalTime <= currentTime) {
                // Como el array ya está ordenado por llegada, el primero que
                // encontremos será el que lleva más tiempo esperando.
                if (tickets[i].premiumCustomer && foundPremium == -1) {
                    foundPremium = i;
                } else if (!tickets[i].premiumCustomer && foundRegular == -1) {
                    foundRegular = i;
                }
            }
        }

        // 2. Elegir a quién atender (Prioridad Premium)
        if (foundPremium != -1) {
            selected = foundPremium;
        } else if (foundRegular != -1) {
            selected = foundRegular;
        } else {
            // 3. Sala de espera vacía: Avanzamos el reloj hasta el próximo cliente
            for (int i = 0; i < n; i++) {
                if (!handled[i]) {
                    currentTime = tickets[i].arrivalTime;
                    break;
                }
            }
            continue; // Volvemos a empezar el bucle con el nuevo tiempo
        }

        // 4. Atender al cliente seleccionado
        int waitTime = currentTime - tickets[selected].arrivalTime;
        int serviceTime = waitTime + tickets[selected].timeToSolve;
        
        // Guardamos el tiempo máximo si hemos batido el récord
        if (serviceTime > maxServiceTime) {
            maxServiceTime = serviceTime;
        }
        
        // Avanzamos nuestro reloj el tiempo que nos tomó resolver el ticket
        currentTime += tickets[selected].timeToSolve;
        handled[selected] = 1; // Marcamos como listo
        ticketsHandled++;
    }

    printf("O tempo de servico maximo e: %d\n", maxServiceTime);
    return 0;
}