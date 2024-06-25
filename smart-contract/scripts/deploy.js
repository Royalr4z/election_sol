async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    const MyContract = await ethers.getContractFactory("Election");
    const myContract = await MyContract.deploy();
  
    await myContract.waitForDeployment();

    const person = await myContract.create_person("6451237", "075.845.485-56", 25);
    await person.wait();

    console.log("person:", JSON.stringify(person));
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  