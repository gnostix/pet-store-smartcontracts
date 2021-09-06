const { deployProxy } = require('@openzeppelin/truffle-upgrades');

const Box = artifacts.require("./upgradeable/Box");


module.exports = async function (deployer) {
  const instance = await deployProxy(Box, [42], { deployer, initializer: 'store' });
  console.log('Deployed', instance.address);
};