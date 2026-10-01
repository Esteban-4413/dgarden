# Sistemas de Comunicações e Redes (SCR)

# 1. Redes de Computadores: conceitos gerais

## 1.1 Classificação por área geográfica

A designação de uma rede depende da **área geográfica** que cobre. Isto condiciona o tipo de protocolos que podem ser usados.

| Sigla | Nome | Cobertura |
|---|---|---|
| **WAN** | Wide Area Network | Área alargada, acima das dezenas de km |
| **MAN** | Metropolitan Area Network | Área metropolitana, até poucas dezenas de km |
| **LAN** | Local Area Network | Área local, até poucas centenas de metros |
| **PAN** | Personal Area Network | Área pessoal, até poucas dezenas de metros |
| **BAN** | Body Area Network | Até uma dezena de metros |

## 1.2 Evolução da largura de banda

- A capacidade dos canais de transporte óptico (OC-3, OC-12, OC-48, OC-192, OTU-3, OTU-4...) cresceu de forma exponencial desde 1990.
- A velocidade das portas Ethernet também evoluiu: 10Base-T → 100Base-T → GbE → 10GbE → 40GbE → 100GbE.
- Ao nível da capacidade total de uma fibra, houve três fases:
  1. **Um só canal por fibra** (155M, 622M, 2.5G, 10G)
  2. **Introdução de DWDM** (multiplexagem por divisão de comprimento de onda: 40 canais de 10G, 80 canais de 10G, etc.)
  3. **Deteção coerente**, com *superchannels* (96 canais de 100G, na ordem dos Tb/s)

## 1.3 WAN vs LAN

**Redes alargadas (WAN)**
- Linhas ponto-a-ponto
- Nós de acesso à rede
- Comutadores de tráfego
- Longas distâncias

**Redes locais (LAN)**
- Linhas e acessos multiponto, ponto-a-ponto ou redes sem fios
- Pequenas distâncias
- Acesso direto à rede

> [!tip] Hoje em dia, nas LAN, o mais comum é:
> - Redes **sem fios**
> - Redes **cabladas** com ligação ponto-a-ponto a um **switch**

## 1.4 A Internet: visão "nuts and bolts"

- **Milhares de milhões de dispositivos** ligados: *hosts* = *end systems* (PCs, servidores, portáteis, smartphones...) que correm **aplicações de rede**.
- **Ligações de comunicação** (*communication links*): fibra, cobre, rádio, satélite. Caracterizam-se pelo **ritmo de transmissão** (*bandwidth*). Podem ser com fios (*wired*) ou sem fios (*wireless*).
- **Comutadores de pacotes** (*packet switches*): reencaminham pacotes (*chunks* de dados). Os principais são os **routers** e os **switches**.

## 1.5 Estrutura da Internet

- A Internet é uma "rede de redes" composta por:
  - **Redes de acesso** (*access nets*)
  - **ISPs de acesso**, **ISPs regionais** e **ISPs Tier 1** (globais)
  - **IXP** (Internet eXchange Points), onde os ISPs se interligam
  - **Peering links**: ligações diretas entre ISPs
  - Grandes fornecedores de conteúdo (ex.: Google), que têm a sua própria rede e se ligam a ISPs e IXPs

### Conceitos importantes

- **ISP**: *Internet Service Provider*. Fornecedor de acesso ou de transporte de Internet.
- **IXP**: *Internet Exchange Point*. Ponto onde redes diferentes trocam tráfego.
- **Peering link**: ligação entre redes para troca direta de tráfego.
- **Router**: encaminha **pacotes** entre redes diferentes.
- **Switch**: encaminha **tramas** dentro de uma LAN.

> [!tip] Para fixar
> Um **router** liga redes diferentes. Um **switch** liga dispositivos dentro da mesma rede local.

**Exemplos de WAN e LAN**
- WAN: ligação entre duas universidades em cidades diferentes através de uma rede de operador.
- LAN: rede de um laboratório da Universidade do Minho.

---

# 2. Redes Locais de Computadores (LAN)

## 2.1 Características

- **Utilização generalizada**: permitem interligar um elevado número de sistemas terminais (computadores, voz, vídeo) em áreas limitadas.
- Em geral, constituem **redes privadas**.
- Tecnologia **normalizada** e de **baixo custo**.
- Topologias mais frequentes: **barramento, anel, estrela e árvore**.

## 2.2 Elementos de uma rede

- **Estações** com interfaces de rede (**NIC**, *Network Interface Cards*)
- **Equipamentos de interligação**: repetidores, bridges, switches, routers...
- **Meios de ligação**: cablagem (coaxial, UTP, fibra óptica) ou *wireless*

| Elemento | Função |
|---|---|
| **NIC** | Interface de rede do dispositivo |
| **Cabo / meio sem fios** | Meio físico por onde os sinais circulam |
| **Repetidor** | Regenera sinais físicos |
| **Bridge** | Liga segmentos de rede ao nível da ligação |
| **Switch** | Encaminha tramas com base em endereços MAC |
| **Router** | Encaminha pacotes entre redes diferentes |

Nas LAN podem ligar-se computadores, servidores, telefones IP, câmaras e sistemas de voz e vídeo.

## 2.3 Topologias LAN

### Barramento
- Todas as estações partilham o mesmo meio (cabo coaxial, portas BNC).
- **Difusão no meio**: o que uma estação transmite é recebido por todas.
- Requer **terminadores** nas extremidades do cabo.

### Anel
- **Transmissão unidirecional** no meio.
- As estações ligam-se ao anel através de **concentradores**.

### Estrela
- Todas as estações ligam-se a um **HUB (repetidor)** central.
- Cabos UTP, portas RJ45.

### Árvore
- Combinação de vários HUBs/Switches ligados em hierarquia (via *up-link*).
- O **switch** tem capacidade de análise de endereços e de *switching*, ao contrário do hub.

### Vantagens e desvantagens

| Topologia | Vantagens | Desvantagens |
|---|---|---|
| **Barramento** | Simples; pouco cabo; baixo custo em redes pequenas antigas | Colisões (requer controlo de acesso ao meio); difícil diagnóstico; uma falha no barramento pode afetar toda a rede; pouco escalável |
| **Estrela** | Fácil de instalar e diagnosticar; falha num cabo afeta só uma estação; com switch há melhor desempenho e isolamento de tráfego | Depende do equipamento central (se o switch falhar, a rede fica comprometida); mais cablagem do que o barramento |
| **Anel** | Acesso ao meio mais previsível; pode evitar colisões se usar *token* | Falha num ponto pode afetar o anel; manutenção mais complexa; pouco comum nas LAN modernas |
| **Árvore** | Escalável; adequada a edifícios, pisos e departamentos; facilita a segmentação | Dependência dos switches superiores; podem ocorrer *loops* se mal configurada; requer planeamento |

> [!note]
> A **estrela** é a topologia dominante em Ethernet moderna. O anel foi usado em tecnologias como Token Ring.

---

# 3. Nível Físico (Nível 1)

Tópicos: **funções do nível físico**, **meios de transmissão** e **equipamento**.

## 3.1 Transmissão de dados: conceitos básicos

### Ponto-a-ponto vs multiponto
- **Ponto-a-ponto (PP)**: ligação dedicada entre dois equipamentos.
- **Multiponto (MP)**: vários equipamentos partilham a mesma ligação.

### Modos de transmissão

| Modo | Descrição | Exemplo |
|---|---|---|
| **Simplex** | Unidirecional | Emissão de rádio tradicional; sensor que só envia dados |
| **Half-duplex** | Bidirecional, **alternado** (os dois lados podem transmitir, mas não ao mesmo tempo) | *Walkie-talkie* |
| **Full-duplex** | Bidirecional, **simultâneo** | Ethernet moderna ligada a switch; chamada telefónica |

## 3.2 Meios de transmissão

### Efeitos indesejáveis
- **Atenuação**
- **Distorção** (ruído, interferência / *cross-talk*)

Os sinais são atenuados ou corrompidos no meio, o que provoca **erros nos dados**.

### A atenuação e/ou distorção dependem de:
- **Distância** entre transmissor e recetor
- **Ritmo de transmissão** (bps, Kbps, Mbps, Gbps)
- **Tipo de meio** de transmissão

> [!warning] Cuidado com as unidades!
> **bps** = bits por segundo (b minúsculo). **Bps** = bytes por segundo. Atenção também a K/M/G.

### Tipos de meios
- **Não guiados**: atmosfera, espaço livre, água do mar. A propagação pode ser omnidirecional ou direcional. Exemplos de tecnologias: Wi-Fi, Bluetooth, rádio, satélite, comunicações móveis.
- **Guiados**: par entrançado (xTP), cabo coaxial (coax), fibra óptica (FO).

Causas de atenuação e distorção: ruído, interferência, *cross-talk*, qualidade dos cabos e conectores, interferências externas.

## 3.3 Meios guiados

### Par entrançado
- **UTP** (*Unshielded Twisted Pair*): sem blindagem.
- **STP** (*Shielded Twisted Pair*): **cada par protegido por écran**.
- Conector **RJ-45**.
- Usado em redes telefónicas e redes locais.

### Cabo coaxial
- Constituído por: condutor interior (*inner conductor*), isolamento (*insulation*), condutor exterior (*outer conductor*) e bainha (*outer sheath*).
- Usado em transmissão de TV e redes locais.

### Fibra óptica
- Dois tipos: **multimodo** e **monomodo** (*single mode*).
  - **Monomodo**: longa distância.
  - **Multimodo**: curta distância.
- Vantagens: **elevada largura de banda**, tamanho e peso reduzidos, **baixa atenuação**, **isolamento eletromagnético**.
- Estrutura: núcleo (*core*, vidro ou plástico), bainha óptica (*cladding*) e revestimento (*jacket*). A luz é emitida por laser ou LED.
- A luz com ângulo inferior ao ângulo crítico é absorvida no revestimento; caso contrário, é refletida e propaga-se no núcleo.
- **Multimodo**: núcleo maior, vários modos de propagação; comum em *data centers* e edifícios.
- **Monomodo**: núcleo menor, apenas um modo de propagação; baixa atenuação e maior alcance.
- Desvantagens: instalação mais delicada; equipamento ótico pode ser mais caro; conectores e fusões exigem cuidado.

### Comparação dos meios guiados

| Meio | Características | Utilização |
|---|---|---|
| **UTP** | Sem blindagem; barato; entrançamento reduz interferência e *cross-talk* | LAN Ethernet, redes telefónicas |
| **STP** | Com blindagem; maior proteção contra interferência; mais caro e menos flexível | Ambientes com interferência |
| **Coaxial** | Melhor blindagem que UTP; mais rígido; menos usado em LAN modernas | Televisão, LAN antigas |
| **Fibra** | Elevada largura de banda, baixa atenuação, imune a interferência eletromagnética | Longa distância (monomodo), curta distância (multimodo) |

## 3.4 Funções da camada física

- **Transmissão de bits** sobre um canal de transmissão.
- Codificação de linha, modulação, multiplexagem física, acesso ao meio, controlo de erros.
- **Definição e normalização das características das interfaces físicas**:

| Característica | O que define |
|---|---|
| **Mecânicas** | Conectores, nº de pinos e respetivas funções |
| **Elétricas** | Níveis elétricos |
| **Funcionais** | Controlo, dados, temporização |
| **Procedimentais** | Sequência de ações entre circuitos |

### Exemplo: interface V.24 / EIA-232-D
- Conector **DB25** para DTE.
- Sinais típicos: `DTR` (DTE Ready), `DCR` (DCE Ready), `RI` (Ring Indicator), `RTS` (Request to Send), `CTS` (Clear to Send), `RLSD` (Received Line Signal Detector), `TxD` (Transmitted Data), `RxD` (Received Data).
- A sequência procedimental tem **três fases**: estabelecimento da chamada, transferência de dados e desfazer da chamada.

## 3.5 Transmissão: série ou paralelo?

Por regra, em telecomunicações, a transmissão faz-se **em série**, bit a bit.

- **Paralela**: vários bits ao mesmo tempo, por canais físicos diferentes. Problemas: sincronização entre fios, interferência, custo e limitações em grandes distâncias.
- **Série**: os bits são enviados um a um. Melhor para longas distâncias, usa menos fios e é compatível com altas velocidades.

### O que interessa conhecer na transmissão?
- **Ritmo binário** (bits/s, Kbps, Mbps, Gbps...)
- **Potência do sinal** (em mW ou dBm)
- **Código de linha** utilizado (forma do sinal que representa os bits)
- **Probabilidade de erro** (P<sub>e</sub>), também designada **BER** (*Bit Error Rate*)

### Técnicas de transmissão em série
- Transmissão **assíncrona**
- Transmissão **síncrona**

> [!note] Noção de **overhead**
> Bits que não transportam informação útil (controlo, sincronização) mas são necessários à comunicação.
> Exemplos: bits de *start* e *stop*, bits de paridade, cabeçalhos, campos de controlo, CRC/FCS, *flags* de início e fim.

---

# 4. Transmissão assíncrona

## 4.1 Estratégia
- Enviar dados em **pequenas unidades (carácter)**.
- Cada código de carácter tem **5 a 8 bits**.
- Os caracteres ocorrem **assincronamente** (o intervalo entre caracteres é imprevisível).

## 4.2 Formato de um carácter

```
Idle → [Start bit] [5 a 8 bits de dados] [bit de paridade (opcional)] [Stop element (1 a 2 bits)] → Idle ou novo Start
```

- A linha em repouso (*idle*) está no estado "1".
- O **start bit** marca o início do carácter e permite ao recetor sincronizar-se.
- O **stop element** devolve a linha ao estado de repouso.

## 4.3 Vantagens
- Sincronização no início e **dentro de cada carácter**.
- Esquema **simples e económico**.

## 4.4 Desvantagens
- **Overhead elevado** (em geral > 20%).
- **Erros** resultantes de **assimetrias** (diferença entre o relógio do emissor e do recetor, *timing error*).

> [!example] Exemplo de overhead
> Com 1 *start bit* + 8 bits de dados + 1 *stop bit*, são 10 bits por cada 8 úteis. Overhead = 2/10 = **20%** (sem contar com o bit de paridade).

---

# 5. Transmissão síncrona

- Usada para transmitir **unidades de dados maiores**.
- Sincronização entre transmissor (Tx) e recetor (Rx):
  - **Não** são usados *start/stop bits*.
  - Ou existe um **canal separado** de sincronização → **sincronização fora da banda**.
  - Ou a sincronização faz-se **no próprio canal de dados** → **sincronização dentro da banda**.

## 5.1 Trama

> [!abstract] Definição
> **Trama** = **campo de controlo** + **campo de dados**
> (Trama é a designação dada à *unidade de dados* ao nível físico.)

- **Campo de controlo**: endereço(s) de destino/origem, comprimento da trama, número de sequência, tipo de dados, etc.
- **Deteção de início e/ou fim de trama**: caracteres especiais ou padrão de bits de alinhamento (**flag**).
  - Exemplos: `<flag><trama><flag>` ou `<preâmbulo><trama>`

Formato geral: `[flag 8 bits][campos de controlo][campo de dados][campos de controlo][flag 8 bits]`

## 5.2 Assíncrona vs síncrona

| | Assíncrona | Síncrona |
|---|---|---|
| Unidade de dados | Carácter (5 a 8 bits) | Trama (bloco maior) |
| Sincronização | *Start/stop bits* em cada carácter | Canal separado (fora da banda) ou no canal de dados (dentro da banda) |
| Overhead | Elevado (> 20%) | Menor |
| Complexidade e custo | Simples e económica | Maior |
| Adequada a | Transmissões irregulares | Transmissões contínuas e de grandes volumes |

---

# 6. Deteção de erros

A cada trama, o **Tx adiciona um número de bits** que será usado pelo **Rx para deteção de erros**.

Em caso de erro, ou o Rx corrige o erro, ou o Tx deve ser notificado (ver ações no nível 2).

## 6.1 Técnicas

1. **Bit e carácter de paridade**
   - Processo simples que reduz a probabilidade de aceitação de tramas erradas.
   - A taxas de transmissão elevadas podem ocorrer erros em bits consecutivos (erros residuais).
   - **Não deteta alguns pares de erros.**
   - Vantagens: simples e de baixo custo. Desvantagem: não deteta todos os erros e pode deixar erros residuais.
2. **Verificação de redundância cíclica (CRC)**

> [!note] Probabilidade de erro residual
> Probabilidade de existirem erros **em número superior** aos que é possível detetar pelo mecanismo utilizado.
> É o caso perigoso: a trama tem erro, mas o mecanismo de deteção aceita-a como válida.

## 6.2 CRC (Cyclic Redundancy Check)

Dada uma mensagem inicial de **$k$ bits**, o transmissor gera uma sequência de **$n-k$ bits** (**CRC** ou **FCS**, *Frame Check Sequence*) tal que os **$n$ bits** da trama resultante sejam **divisíveis por um número pré-determinado $G$**.

```
| k bits (mensagem) | + | n-k bits (dígitos de verificação) | = | n bits (dados a transmitir) |
```

### Na receção
1. Dividir a trama recebida por $G$.
2. Se **resto = 0** → decide-se que **não há erro**. Caso contrário → **há erro**.

> [!warning] Limitação
> Pode falhar se o número de erros for superior à capacidade de deteção do código $C(n,k)$.

### Formulação com polinómios

O processo CRC é geralmente expresso através de **polinómios de uma variável com coeficientes binários**, usando **aritmética módulo 2**.

> [!tip] Aritmética módulo 2
> - A soma equivale a **XOR**.
> - Não há transporte (*carry*).
> - A subtração equivale à soma.

- $G(x)$: polinómio gerador, de **grau $n-k$**, de um código sistemático $(n,k)$
- $D(x)$: polinómio correspondente aos dados da mensagem
- $R(x)$: dígitos de verificação = **resto da divisão de $x^{n-k} D(x)$ por $G(x)$**
- $C(x)$: polinómio da palavra de código

> [!note] Código sistemático
> A palavra de código contém explicitamente os dados originais ($D$) e os bits de verificação ($R$). No exemplo $(7,4)$: 4 bits de dados + 3 de verificação = 7 bits no total.

$$C(x) = R(x) + x^{n-k} \cdot D(x)$$

Palavra de código $(n,k)$, do bit menos significativo para o mais significativo:

```
| R (n-k bits) | D - dados (k bits) |
```

### Exemplo de polinómio gerador: CRC-32

$$x^{32}+x^{26}+x^{23}+x^{22}+x^{16}+x^{12}+x^{11}+x^{10}+x^{8}+x^{7}+x^{5}+x^{4}+x^{2}+x+1$$

Normalizado para transmissão síncrona ponto-a-ponto (IEEE 802.x).

### Circuito codificador genérico

Para um polinómio $G(x) = x^{n-k} + g_{n-k-1}x^{n-k-1} + \dots + g_1 x + 1$, o circuito contém:
- Um **registo de $n-k$ bits** (comprimento do FCS)
- **$n-k$ ou-exclusivos** (dependem dos coeficientes de $G(x)$)

Existem dois modos de funcionamento (comutador nas posições 1 e 2): primeiro os dados $D(x)$ são enviados e ao mesmo tempo processados no registo; depois, o conteúdo do registo (o resto) é enviado a seguir, formando $C(x)$.

## 6.3 Exercício resolvido

> [!question] Enunciado
> Seja $g(x) = 1 + x + x^3$ o polinómio gerador de um código sistemático $(7,4)$.
> 1. Determinar as palavras de código para **A)** $D_1 = (1010)$ e **B)** $D_2 = (1100)$.
> 2. Se o recetor receber $C = (0110101)$, será válida? E se for $C = (0011010)$?

**Convenção dos slides**: o bit menos significativo está à esquerda, ou seja, $(d_0 d_1 d_2 d_3)$. A palavra de código é $R$ seguido de $D$.

**Passo prévio**: $n-k = 3$, logo $x^3 \equiv x + 1 \pmod{g(x)}$. Daqui:
- $x^4 \equiv x^2 + x$
- $x^5 \equiv x^3 + x^2 \equiv x^2 + x + 1$
- $x^6 \equiv (x+1)^2 = x^2 + 1$

**A) $D_1 = (1010) \Rightarrow D(x) = 1 + x^2$**
- $x^3 D(x) = x^3 + x^5 \equiv (x+1) + (x^2+x+1) = x^2$
- $R(x) = x^2 \Rightarrow R = (001)$
- **Palavra de código: $(001\,1010)$** = `0011010`

**B) $D_2 = (1100) \Rightarrow D(x) = 1 + x$**
- $x^3 D(x) = x^3 + x^4 \equiv (x+1) + (x^2+x) = x^2 + 1$
- $R(x) = 1 + x^2 \Rightarrow R = (101)$
- **Palavra de código: $(101\,1100)$** = `1011100`

**Verificação de $C = (0110101)$**
- $R_{recebido} = (011)$, $D = (0101) \Rightarrow D(x) = x + x^3$
- $x^3 D(x) = x^4 + x^6 \equiv (x^2+x) + (x^2+1) = x + 1 \Rightarrow R_{esperado} = (110)$
- $(011) \neq (110)$ → **palavra INVÁLIDA → erro detetado.**

**Verificação de $C = (0011010)$**
- É exatamente a palavra de código obtida em **A** → **VÁLIDA.**

---

# 7. Correção de erros

Há duas grandes estratégias para lidar com erros.

## 7.1 FEC (Forward Error Correction)

- É o **recetor que corrige** o erro.
- Para ter probabilidades de erro aceitáveis, o código tem de ser gerado por um polinómio com **grau da mesma ordem de grandeza** do dos dados (muito *overhead*).
- **Técnica pouco usada** em comunicação de dados.
- Apenas usada onde a **retransmissão é impraticável**.
- Em geral, **é preferível retransmitir**.
- Exemplos de utilização: comunicações espaciais, satélite, *streaming* em tempo real, alguns sistemas *wireless* (onde a latência é crítica).

## 7.2 ARQ (Automatic Repeat Request)

- O recetor **não tenta corrigir** os erros.
- O código de controlo de erros é usado **apenas como detetor** de erros.
- Detetados erros, o recetor **pede a retransmissão** da unidade de dados.
- Probabilidades de erro aceitáveis podem ser obtidas com **polinómios de menor grau**.
- **Técnica mais usada** em comunicação de dados.
- Vantagens: simples; menor *overhead* do que uma FEC forte; funciona bem quando a retransmissão é possível.
- Desvantagens: introduz atraso devido às retransmissões; depende de um canal de retorno; mau em ligações com muita latência.

| | FEC | ARQ |
|---|---|---|
| Quem corrige? | Recetor | Emissor (retransmite) |
| Retransmissão | Não é necessária | Necessária quando há erro |
| Overhead do código | Elevado | Menor |
| Latência | Pode ser menor (evita retransmissões) | Pode aumentar com retransmissões |
| Complexidade | Maior | Menor |
| Utilização | Rara (satélite, tempo real, canais sem retorno) | Mais comum (redes de dados) |

---

# Resumo para exame

## Ideias principais

- A classificação **WAN, MAN, LAN, PAN e BAN** depende da área coberta.
- As LAN modernas usam frequentemente topologia em **estrela** com switches.
- O nível físico transmite bits e define características **mecânicas, elétricas, funcionais e procedimentais**.
- Os meios podem ser **guiados** (par entrançado, coaxial, fibra) ou **não guiados**.
- A fibra oferece elevada largura de banda e baixa atenuação (monomodo = longa distância, multimodo = curta).
- A transmissão pode ser **simplex, half-duplex ou full-duplex**; em telecomunicações é normalmente **em série**.
- **Assíncrona**: carácter a carácter com *start/stop*, simples, overhead > 20%. **Síncrona**: tramas maiores, exige sincronização.
- **Overhead** é a informação extra que não corresponde a dados úteis.
- **Paridade** é simples mas pouco robusta. **CRC** é robusto e usa divisão polinomial em aritmética módulo 2 (resto 0 = sem erros detetados).
- **FEC**: o recetor corrige. **ARQ**: o recetor deteta e pede retransmissão (a mais usada).

## Perguntas rápidas

> [!question]- Qual é a diferença entre LAN e WAN?
> Uma LAN cobre uma área local (sala, edifício, campus). Uma WAN cobre longas distâncias, normalmente interligando cidades, países ou organizações.

> [!question]- O que faz a camada física?
> Transmite bits através de um meio físico e define características como sinais, conectores, níveis elétricos, temporização e meios de transmissão.

> [!question]- O que é overhead?
> É a informação extra enviada para controlo, sincronização ou deteção de erros, além dos dados úteis.

> [!question]- Porque é que a transmissão assíncrona tem overhead elevado?
> Porque cada carácter precisa de bits adicionais: *start*, *stop* e possivelmente paridade.

> [!question]- Porque é que o CRC é melhor do que a paridade?
> Porque deteta mais padrões de erro e é mais robusto para blocos de dados maiores.

> [!question]- Qual é a diferença entre FEC e ARQ?
> Na FEC, o recetor corrige o erro. Na ARQ, o recetor apenas deteta o erro e pede retransmissão.

## Mapa mental

```text
Sistemas de Comunicações e Redes
├── Redes
│   ├── WAN
│   ├── MAN
│   ├── LAN
│   ├── PAN
│   └── BAN
├── LAN (topologias)
│   ├── Barramento
│   ├── Estrela
│   ├── Anel
│   └── Árvore
├── Nível físico
│   ├── Meios de transmissão
│   │   ├── Guiados
│   │   │   ├── Par entrançado (UTP / STP)
│   │   │   ├── Coaxial
│   │   │   └── Fibra ótica (mono / multimodo)
│   │   └── Não guiados
│   │       ├── Rádio
│   │       ├── Wi-Fi
│   │       └── Satélite
│   ├── Interfaces
│   │   ├── Mecânicas
│   │   ├── Elétricas
│   │   ├── Funcionais
│   │   └── Procedimentais
│   └── Transmissão
│       ├── Assíncrona
│       └── Síncrona
└── Erros
    ├── Paridade
    ├── CRC
    ├── FEC
    └── ARQ
```
# links
- [[LCC-SCR-1_unlocked.pdf]]
