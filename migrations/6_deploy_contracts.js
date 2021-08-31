var GnostixCoin = artifacts.require("GnostixCoin");

module.exports = function(deployer) {
  deployer.deploy(GnostixCoin);
};