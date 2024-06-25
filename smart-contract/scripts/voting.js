
async function main() {
  
    const contractAddress = "0x < Endereço do Contrato >"; 
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

  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  