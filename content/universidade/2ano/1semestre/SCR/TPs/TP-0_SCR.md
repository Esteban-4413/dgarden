# Emulador de Rede e Analisador de Tráfego (Sniffer)

## Download da máquina virtual
Informação e documentação sobre as Máquinas Virtuais e/ou Contentores Docker com CORE Emulator em Xubuntu para uso nas aulas práticas. 
[Maquina virtual](http://marco.uminho.pt/ferramentas/CORE/xubuncore.html) (user: core password: core).

### Bugs 
No meu caso (MacBook air M4) decidí instalar o número 2 (XubunCORE 9.2.1 - Plataforma arm64 (aarch64) - Recomendado para Apple Silicon M1/M2/M3 ou outros ARM) dado que era o mais compativel com a minha máquina
- XubunCORE 9.2.1 ARM64 (Xubuntu 22.04.5 LTS ARM64 + CORE Emulator 9.2.1) 
- XubunCORE_9_2_arm64: 40GB Disco, 4GB Memória, 2 Processadores, 2 x Intel PRO/100 em NAT
Ao tentar importar o ficheiro `.ova` para a VirtualBox deu o seguinte erro:
```txt
Error reading "/Users/estebanyepezorozco/Downloads/XubunCORE_9_2_arm64.ova": Unknown resource type 32768 in hardware item, line 59.

Result Code: 
VBOX_E_FILE_ERROR (0x80BB0004)
Component: 
ApplianceWrap
Interface: 
IAppliance {86a98347-7619-41aa-aece-b21ac5c1a7e6}

XubunCORE 9.2.1 - Plataforma arm64 (aarch64) - Recomendado para Apple Silicon M1/M2/M3 ou outros ARM 
```
Para solucionar isso tive de mudar a extensão `.ova` para `.tar` de forma a conseguir expandir os ficheiros e assim editar a linha de código 59 no ficheiro de extensão `.ovf`. Na linha encontramos um bloco `<Item>`
