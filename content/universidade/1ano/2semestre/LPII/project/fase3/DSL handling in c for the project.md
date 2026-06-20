```txt
├  └  ─  │
```

```txt

paciencias/
│	├── golf.paciencia
│	├── simpleSimon.paciencia
│	├── freeCell.paciencia
│
src/
├── main.c              ← punto de entrada, menu principal
│
├── dsl/
│	├── parser.h/.
│	├── loader.h/.c      
│
├── engine/
│   ├── card.h/.c       ← carta: valor + naipe
│   ├── stack.h/.c      ← pilha: tipo + cartas
│   ├── gamedef.h/.c    ← definición del juego (tipos, MOVs, WINs)
│   ├── gamestate.h/.c  ← estado actual (las pilas con sus cartas)
│   ├── move.h/.c       ← lógica de validar y ejecutar movimientos
│   ├── undo.h/.c       ← historial de estados (para voltar atrás)
│   ├── saveload.h/.c   ← save/load al formato del enunciado
│
└── ui/
    ├── display.h/.c    ← mostrar el tablero en pantalla
    ├── input.h/.c      ← leer comandos del usuario
```

 `opendir` / `readdir` → `loader.c`
Solo para **listar los ficheros** de la carpeta `paciencias/`. No lee el contenido, solo los nombres de los ficheros. \["C programming read directory opendir"  - Jacob Sorber]

 `fopen` / `fgets` / `fclose` → `parser.c`
Para **leer el contenido** de cada fichero `.paciencia` línea a línea y extraer los comandos (`JOGO`, `TIPO`, `INIT`, `MOV`...). \[file handling in C fopen fgets]

 `fopen` / `fprintf` / `fscanf` → `saveload.c`
Para **guardar y cargar** el estado de una partida en el formato que describe el enunciado.

```txt
loader.c        → "¿qué ficheros hay en paciencias/?"
    ↓
parser.c        → "lee el contenido de golf.paciencia"
    ↓
gamestate.c     → "crea el juego con esas reglas"
    ↓
saveload.c      → "guarda/carga una partida"
```

1. Abrir carpeta "paciencias/" con opendir()
2. Para cada fichero → parsear DSL → guardar GameDef en una lista
3. Mostrar menú al usuario: "Elige una paciencia"
4. Usuario elige → crear GameState inicial (barajar cartas, distribuir)
5. Loop del juego:
   a. Mostrar estado
   b. Leer comando del usuario (mover, undo, save, load, salir)
   c. Si mover → validar con las MoveRules → ejecutar → guardar en historial
   d. Si undo → restaurar estado anterior del historial
   e. Comprobar condición WIN
6. Fin


