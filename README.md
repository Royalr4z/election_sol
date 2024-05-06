<h1>election_sol</h1>

## Tecnologias Utilizadas

- **Linguagem:** Solidity
- **Ethereum IDE:** Remix

## Partidos:
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

## Executando o Smart Contract 
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
   - Função responsável por exibir o número de votos de um determinado partido
<br/>&nbsp;     ├── @param {string} parties - Nome do Partido.
<br/>&nbsp;     └── @returns {uint256} - Retorna o número de Votos que esse partido recebeu.

4. people
   - Função responsável por exibir as informações do eleitor e se ele já votou
<br/>&nbsp;     ├── @param {address} people - Endereço do eleitor.
<br/>&nbsp;     └── @returns {person} - Retorna as informações pessoais desse eleitor.

# Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues relatando problemas, sugestões ou novos recursos que gostaria de ver. Se deseja contribuir com código, por favor, envie um pull request.
