
async function main() {
  
    const contractAddress = "0x <Endereço-do-Contrato>"; 
    const MyContract = await ethers.getContractFactory("Election");
    const myContract = MyContract.attach(contractAddress);

    const readline = require('readline');

    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout
    });

    function input(prompt) {
      return new Promise(resolve => {
        rl.question(prompt, (input) => {
          resolve(input);
        });
      });
    }

    console.log("Escolha o partido que deseja votar: ");
    console.log(" 0 - PRONA  ");
    console.log(" 1 - ARENA  ");
    console.log(" 2 - PL     ");
    console.log(" 3 - UNIAO  ");
    console.log(" 4 - PT     ");

    const vote = await input('');
    rl.close();

    const voting = await myContract.Voting(parseInt(vote));
    await voting.wait();

    const view_voting = await myContract.get_voting();
    const view_voting_list = view_voting.toString().split(',');
    console.log("Votos dos partidos: ");
    console.log(` - PRONA: ${view_voting_list[0]}`);
    console.log(` - ARENA: ${view_voting_list[1]}`);
    console.log(` - PL:    ${view_voting_list[2]}`);
    console.log(` - UNIAO: ${view_voting_list[3]}`);
    console.log(` - PT:    ${view_voting_list[4]}`);

  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  