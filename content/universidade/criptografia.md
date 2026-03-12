> **Criptografia RSA:** A Matemática que protege a Internet.
> **Objetivo:** Criar um cadeado digital inquebrável usando Teoria dos Números.

**1. A Base (Números Primos):**
A segurança começa multiplicando dois números primos gigantes ($p$ e $q$):
$$n = p \times q$$

**2. Encriptar (Trancar a Mensagem):**
Para esconder uma mensagem $m$ e transformá-la em código secreto $c$, usamos a chave pública $e$:
$$c \equiv m^e \pmod n$$

**3. Desencriptar (A Chave Mestra):**
Só quem possui a chave privada $d$ consegue reverter a matemática e recuperar a mensagem original:
$$m \equiv c^d \pmod n$$

---
**Na prática:** É esta aritmética modular que garante que as tuas mensagens privadas e as tuas contas bancárias não podem ser decifradas, mesmo pelo computador mais rápido do mundo.