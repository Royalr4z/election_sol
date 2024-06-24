async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    const MyContract = await ethers.getContractFactory("Election");
    const myContract = await MyContract.deploy();
  
    await myContract.waitForDeployment();
  
    console.log("Contract deployed to:", myContract.address);

    const person = await myContract.create_person("6451237", "075.845.485-56", 25);
    const voting = await myContract.Voting(0);
    console.log("person:", person.toString());
    console.log("voting:", voting.toString());
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  