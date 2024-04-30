<h1>election_sol</h1>

## Tecnologias Utilizadas

- **Linguagem:** Solidity
- **Ethereum IDE:** Remix

## Executando o Smart Contract 
- <h3>Métodos:<h3>

1. create_person
   - Função responsável por cadastra o eleitor
   - Parametros:
     ```
     uint256 CPF,
     uint256 age
     ```

2. Voting
   - Função em o eleitor escolhe o partido em que vai votar
   - Parametros:
     ```
     parties_enum option
     ```
   - Partidos:
     ```
     _______________________
     | option | num        |
     |---------------------|
     | PRONA  | 0          |
     | PL     | 1          |
     | UNIAO  | 2          |
     | PT     | 3          |
     | PP     | 4          |
     |________|____________|
     ```

3. parties
   - Função responsável por exibir o número de votos de um determinado partido
   - Parametros:
     ```
     string parties
     ```

4. people
   - Função responsável por exibir as informações do eleitor e se ele já votou
   - Parametros:
     ```
     address people
     ```
