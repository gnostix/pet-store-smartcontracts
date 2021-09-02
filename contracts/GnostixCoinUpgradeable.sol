// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";


contract GnostixCoinUpgradeable is  Initializable, ERC20Upgradeable, OwnableUpgradeable {

 
    function initialize()  initializer public {
        __ERC20_init("GnostixCoinUpgradeable", "GNXUP");
        __Ownable_init();
        _mint(msg.sender, 10000 * 10 * decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

