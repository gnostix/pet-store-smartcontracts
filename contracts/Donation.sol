// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract Donation {
    struct Donator {
        address donator;
        uint256 amount;
    }
    mapping(address => Donator) public donations;
    uint public totalDonations;

    event NewDonation(address donator, uint amount);

    Donator public highestDonator;

    function donate() public payable {
        require(msg.value > 0, "Amount cannot be negative");

        donations[msg.sender] = Donator(msg.sender, msg.value);
        totalDonations += msg.value;
        checkHighestBid();

        emit NewDonation(msg.sender, msg.value);
    }

    function checkHighestBid() internal {
        if (msg.value > highestDonator.amount) {
            highestDonator = Donator(msg.sender, msg.value);
        }
    }

    function getHighestDonator() public view returns (address, uint256) {
        return (highestDonator.donator, highestDonator.amount);
    }
}
