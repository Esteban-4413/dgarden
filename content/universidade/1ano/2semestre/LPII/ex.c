typedef struct {
  // nomes dos tipos daa pilhas 
  // movimentos possiveis 
  // movimentos automaticos 
  Movimento * autos; // array de movimentos automaticos
  size_t total_autos // qts movimentos automaticos existem
  // condiçãpo de vitoria
  // estados das pilhas
} EstadoPilhas;

typedef struct{
  size_t total_pilhas;
  PilhasCartas * pilhas; // array de pilhas de cartas
} EstadoPilhas;

enum caracteristicas_tipo_pilha{
  CARTAS_TODAS_VISIVEIS, // = 
  CARTAS_TODAS_INVISIVEIS, // _
  SO_MOSTRA_A_CARTA_TIPO // 1
}

typedef struct {
  char * nome_tipo;
  enum caracteristicas_tipo_pilha;
  Carta * cartas; // array das cartas. [0] é 
}



//gravar em ficheiro o estado
void save_game(EstadoJogo * estado, char * ficheiro){
  fopen(ficheiro);
  fwrite(..);
}

EstadoJogo * load_game(char * ficheiro) {
  // ler a primeira linha para obter o nome da paciencia
  fgets(..);
  char * nome_da_paciencia;
  fopen("paciencias7{}");
  EstadoJogo  * inicial = load_paciencia(nome_da_paciencia);

  //overwrite do estado inicial como o estado descrito no save save_game
}

EstadoJogo load_paciencia(char * ficheiro){
  EstadoJogo estado = novo_estado();
  //Enquanto o ficheiro não for totalmente lido 
  //
}

PilhasCartas * interpreta_comando_init(){

}

typedef struct
{
  int pilha_origem;
  int pilha_destino;
  int total_cartas:
} Movimento;

PilhasCartas * interpreta_comando_init(char * tipo, char * flag){
  enum caracteristicas_tipo_pilha carcts = traduz_flags_em_caracteristicas_tipo_pilha(flags)
}

int movimento_e_valido(EstadoJogo * estado, Movimento * m){

}

//altera o estado com o efeito de aplicar o movimento_e_valido
int aplica_movimento(EstadoJogo * estado, Movimento * m){

}

//aplica os movimentos automaticos
int aplica_autos(EstadoJogo * estado){
  for(size_t i = 0; i < estado->total_autos; i++){
    aplica_movimento(estad, estado->autos[i]);
  }
}
