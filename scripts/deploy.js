const { ethers } = require("hardhat");

async function main() {
  const HealthCareDataChain = await ethers.getContractFactory("HealthCareDataChain");
  const contract = await HealthCareDataChain.deploy();
  await contract.deployed();

  console.log("HealthCareDataChain deployed to:", contract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
