const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying with:", deployer.address);

  const Token = await ethers.getContractFactory("TestToken");
  const token = await Token.deploy();
  await token.deployed();
  console.log("TestToken deployed to:", token.address);

  const MicroLend = await ethers.getContractFactory("MicroLend");
  const microLend = await MicroLend.deploy(token.address);
  await microLend.deployed();
  console.log("MicroLend deployed to:", microLend.address);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
