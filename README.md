# Election_sol

## Tecnologias Utilizadas

- **Framework Blockchain:** Hyperledger Besu
- **Linguagem de Contratos Inteligentes:** Solidity
- **Ferramenta de Deploy:** Hardhat
- **IDE Ethereum:** Remix

## Configuração do Hyperledger Besu para Rede Privada (QBFT)

Aqui estão os passos para configurar e iniciar uma rede privada usando Hyperledger Besu com múltiplos nós:

### Iniciando Node-1

```bash
cd Node-1
besu --data-path=data --genesis-file=../genesis.json --rpc-http-enabled --rpc-http-api=ETH,NET,QBFT --host-allowlist="*" --rpc-http-cors-origins="all"
```

### Iniciando Node-2

```bash
cd Node-2
besu --data-path=data --genesis-file=../genesis.json --bootnodes=<Node-1 Enode URL> --p2p-port=30304 --rpc-http-enabled --rpc-http-api=ETH,NET,QBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8546
```
### Iniciando Node-3

```bash
cd Node-3
besu --data-path=data --genesis-file=../genesis.json --bootnodes=<Node-1 Enode URL> --p2p-port=30305 --rpc-http-enabled --rpc-http-api=ETH,NET,QBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8547
```

### Iniciando Node-4

```bash
cd Node-4
besu --data-path=data --genesis-file=../genesis.json --bootnodes=<Node-1 Enode URL> --p2p-port=30306 --rpc-http-enabled --rpc-http-api=ETH,NET,QBFT --host-allowlist="*" --rpc-http-cors-origins="all" --rpc-http-port=8548
```

## Smart Contract 
### Partidos:
  ```
  _______________________
  | option | num        |
  |---------------------|
  | PRONA  | 0          |
  | ARENA  | 1          |
  | PL     | 2          |
  | UNIAO  | 3          |
  | PT     | 4          |
  |________|____________|
  ```

### Funções do Smart Contract 
- <h3>Métodos:</h3>

1. create_person
   - Função responsável por cadastra o eleitor
<br/>&nbsp;     ├──  @param {string} RG - RG do eleitor.
<br/>&nbsp;     ├──  @param {string} CPF - CPF do eleitor.
<br/>&nbsp;     ├──  @param {uint256} age - Idade do eleitor.
<br/>&nbsp;     └──  @returns {void}

2. Voting
   - Função em o eleitor escolhe o partido em que vai votar
<br/>&nbsp;     ├── @param {parties_enum} option - Número do Partido.
<br/>&nbsp;     └── @returns {void}

3. parties
   - Função responsável por exibir o número de votos recebidos de um determinado partido
<br/>&nbsp;     ├── @param {string} parties - Nome do Partido.
<br/>&nbsp;     └── @returns {uint256} - Retorna o número de Votos que esse partido recebeu.

4. Viewing_Voting
   - Função responsável por exibir o número de votos recebidos de todos os partidos
<br/>&nbsp;     └── @returns {view_election} - Retorna uma Lista com todos os partidos e o número de votos recebidos.

5. people
   - Função responsável por exibir as informações do eleitor e se ele já votou
<br/>&nbsp;     ├── @param {address} people - Endereço do eleitor.
<br/>&nbsp;     └── @returns {person} - Retorna as informações pessoais desse eleitor.

# Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues relatando problemas, sugestões ou novos recursos que gostaria de ver. Se deseja contribuir com código, por favor, envie um pull request.
