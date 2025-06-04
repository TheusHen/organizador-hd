# Organizador HD

**Meu próprio organizador e limpador**
→ Apaga pastas `node_modules` para liberar espaço
→ Organiza automaticamente arquivos em subpastas por extensão

## Descrição

Este projeto é um utilitário para Windows que ajuda a:

✅ Limpar pastas `node_modules` em qualquer diretório, liberando espaço em disco.
✅ Organizar automaticamente arquivos em pastas como `videos`, `images`, `pdfs`, `docs` e `others` com base na extensão.

Feito com uma interface simples em **HTA (HTML Application) com VBScript**, que usa o **Gerenciador de Arquivos** do Windows para seleção de pasta, e a lógica funcional implementada em **PowerShell**.

## Funcionalidades

* **Limpeza Recursiva**: Busca e apaga todas as pastas `node_modules` em um diretório.
* **Organização Inteligente**: Move arquivos automaticamente para subpastas específicas com base nas extensões.
* **Interface Gráfica**: Interface leve em HTA com botões personalizados e seleção fácil de pastas pelo gerenciador padrão do Windows.
* **Portátil**: Não depende de instalação de software adicional, apenas o PowerShell do Windows.

## 🚀 Como Usar

1. **Clone ou baixe** este repositório.
2. **Dê um duplo clique** no arquivo `.hta` (ex: `interface.hta`).
3. **Clique no botão desejado**:

   * **Limpar** — para apagar pastas `node_modules`
   * **Organizar** — para organizar os arquivos da pasta selecionada
4. **Selecione a pasta** desejada usando o gerenciador de arquivos do Windows.
5. O script executará automaticamente a tarefa.

## Licença

Este projeto está licenciado sob a **[GNU GPL-3.0](LICENSE)** — você pode usar, modificar e distribuir livremente, desde que mantenha a mesma licença.

**Feito por TheusHen para otimizar meu fluxo de trabalho!**