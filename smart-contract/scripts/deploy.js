async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Implantando contratos com a conta: ", deployer.address);
  
    const MyContract = await ethers.getContractFactory("Election");
    const myContract = await MyContract.deploy();
  
    await myContract.waitForDeployment();

    console.log("Endereço do Contrato: ", myContract.target);

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

    console.log("Informe seu RG: ");
    const RG = await input('  ');

    console.log("Informe seu CPF: ");
    const CPF = await input(' ');

    console.log("Informe sua idade: ");
    const age = await input(' ');
    rl.close();

    const person = await myContract.create_person(RG, CPF, parseInt(age));
    await person.wait();

  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  