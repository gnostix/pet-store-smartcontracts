// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

import "./Donation.sol";

contract Adoption is Donation {
    address payable public owner;

    address[16] public adopters;

    event NewAdoption(address adopter, uint256 petId);

    constructor() {
        owner = msg.sender;
    }

    function adopt(uint256 petId) public returns (uint256) {
        require(petId >= 0 && petId <= 15);

        adopters[petId] = msg.sender;
        emit NewAdoption(msg.sender, petId);

        return petId;
    }

    // Retrieving the adopters
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }

    function kill() public {
        if (msg.sender == owner) selfdestruct(owner);
    }

    function changeOwner(address payable newOwner) public {
        if (msg.sender == owner) owner = newOwner;
    }
}
