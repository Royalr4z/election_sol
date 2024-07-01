async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Implantando contratos com a conta: ", deployer.address);
  
    const MyContract = await ethers.getContractFactory("Election");
    const myContract = await MyContract.deploy();
  
    await myContract.waitForDeployment();

    console.log("Endereço do Contrato: ", myContract.target);

  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  