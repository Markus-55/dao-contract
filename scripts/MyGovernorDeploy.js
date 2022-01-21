// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const MyToken = await hre.ethers.getContractFactory("MyToken");
  const MyGovernor = await hre.ethers.getContractFactory("MyGovernor");
  const MyTimelockController = await hre.ethers.getContractFactory("MyTimelockController");

  const myToken = await MyToken.deploy();
  const myTimelockController = await MyTimelockController.deploy(1, ["0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"], ["0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"]);
  const myGovernor = await MyGovernor.deploy(myToken.address, myTimelockController.address);
  
  await myToken.deployed();
  await myTimelockController.deployed();
  await myGovernor.deployed();

  console.log("MyGovernor deployed to:", myGovernor.address);
  console.log("MyToken deployed to:", myToken.address);
  console.log("MyTimelockController deployed to:", myTimelockController.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });