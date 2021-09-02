var GnostixCoinUpgradeable = artifacts.require("GnostixCoinUpgradeable");

module.exports = function(deployer) {
  deployer.deploy(GnostixCoinUpgradeable);
};