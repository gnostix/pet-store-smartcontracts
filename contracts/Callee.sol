// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract Callee {

    uint256[] public values;

    event Received(address caller, uint256 amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    receive() external payable {
        emit Received(msg.sender, msg.value, "receive was called");
    }

    function getValue(uint256 initial) public pure returns (uint256) {
        return initial + 150;
    }

    function storeValue(uint256 value) public {
        values.push(value);
    }

    function getValues() public view returns (uint256) {
        return values.length;
    }

}
