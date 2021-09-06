const { upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const Box = artifacts.require('./upgradeable/Box');
const BoxV2 = artifacts.require('./upgradeable/BoxV2');

module.exports = async function (deployer) {
  const existing = await Box.deployed();
  const instance = await upgradeProxy(existing.address, BoxV2, { deployer });
  console.log("Upgraded", instance.address);
};