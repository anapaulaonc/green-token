# Green Token (GT) - Internet Computer Token Project

Este projeto implementa um token básico na Internet Computer utilizando a linguagem Motoko. O token inclui funcionalidades como criação (mint), transferência e queima (burn) de tokens, além de gerenciamento de membros.

## Funcionalidades

### Sistema de Token
- Criação (mint) de novos tokens
- Consulta de saldo de tokens
- Transferência de tokens entre usuários
- Queima (burn) de tokens
- Consulta do fornecimento total de tokens

### Sistema de Gerenciamento de Membros
- Adicionar membros
- Atualizar informações de membros
- Remover membros
- Consultar informações de membros específicos
- Listar todos os membros

## Requisitos

Para executar este projeto você precisará:

- [DFINITY Canister SDK (dfx)](https://internetcomputer.org/docs/current/developer-docs/setup/install)
- [Node.js e npm](https://nodejs.org/) (versão 14 ou superior)
- [Motoko Package Manager (mops)](https://mops.one/)

## Configuração do Ambiente

### 1. Instalar o DFINITY Canister SDK (dfx)

```bash
sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
```

Verifique a instalação:
```bash
dfx --version
```

### 2. Instalar o Motoko Package Manager (mops)

```bash
npm i -g ic-mops
```

Verifique a instalação:
```bash
mops --version
```

## Configuração do Projeto

### 1. Clone o repositório

```bash
git clone [URL_DO_SEU_REPOSITÓRIO]
cd [NOME_DO_DIRETÓRIO]
```

### 2. Instale as dependências do projeto

```bash
mops init
mops install
```

### 3. Inicie o ambiente de desenvolvimento local

```bash
dfx start --clean --background
```

### 4. Implante os canisters

```bash
dfx deploy
```

## Testando o Token

Você pode testar o token através da interface Candid UI:

1. Obtenha o ID do canister:
```bash
dfx canister id [NOME_DO_CANISTER]
```

2. Acesse a interface Candid:
   - Local: `http://localhost:8000/candid?canisterId=[ID_DO_CANISTER]`
   - IC: `https://[ID_DO_CANISTER].ic0.app/candid`

### Exemplos de Testes

#### Mint de Tokens
- Use a função `mint` com um Principal ID e a quantidade desejada
- Exemplo: `mint("2vxsx-fae", 1000)`

#### Verificação de Saldo
- Use `balanceOf` com o Principal ID
- Exemplo: `balanceOf("2vxsx-fae")`

#### Transferência de Tokens
- Use `transfer` especificando remetente, destinatário e quantidade
- Exemplo: `transfer("2vxsx-fae", "rrkah-fqaaa-aaaaa-aaaaq-cai", 300)`

#### Queima de Tokens
- Use `burn` com o Principal ID e a quantidade a ser queimada
- Exemplo: `burn("2vxsx-fae", 200)`

## Estrutura do Projeto

```
src/
├── token/
│   ├── main.mo       # Implementação principal do token
│   └── types.mo      # Definições de tipos
├── members/
│   ├── main.mo       # Gerenciamento de membros
│   └── types.mo      # Definições de tipos
dfx.json              # Configuração do projeto
```

## Desenvolvimento Adicional

### Adicionar um Novo Membro
```motoko
// Exemplo: Adicionar um novo membro
let memberPrincipal = Principal.fromText("2vxsx-fae");
let newMember = { name = "Alice"; age = 30 };
await addMember(memberPrincipal, newMember);
```

### Transações com Tokens
```motoko
// Exemplo: Transferir tokens entre usuários
let from = Principal.fromText("2vxsx-fae");
let to = Principal.fromText("rrkah-fqaaa-aaaaa-aaaaq-cai");
let amount = 100;
await transfer(from, to, amount);
```

## Solução de Problemas

### Erro: Command not found: mops
Certifique-se de que o mops está instalado globalmente:
```bash
npm i -g ic-mops
```

### Erro: Error while resolving Motoko packages
Execute:
```bash
mops init
mops install
```

### Canister Has No Update Method
Certifique-se de que os métodos públicos estão marcados com `shared` para serem acessíveis externamente:
```motoko
public shared func mint(owner : Principal, amount : Nat) : async Result<(), Text> {
    // implementação
};
```

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para enviar pull requests ou abrir issues para melhorias e correções de bugs.

