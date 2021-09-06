// SPDX-License-Identifier: MIT
pragma solidity >0.7.0;

contract Caller {
    event Response(bool success, bytes data);
    event Received(address caller, uint256 amount, string message);

    function stealEth(address addr) public view returns (uint256) {
        Callee c = Callee(addr);
        return address(c).balance;
    }

    receive() external payable {
        emit Received(msg.sender, msg.value, "receive was called");
    }

    function someAction(address addr) public returns (uint256) {
        Callee c = Callee(addr);
        return c.getValue(100);
    }

    function storeAction(address addr) public returns (uint256) {
        Callee c = Callee(addr);
        c.storeValue(100);
        return c.getValues();
    }

    function someUnsafeAction(address addr) public {
        (bool success, bytes memory data) = addr.call(
            abi.encodeWithSignature("storeValue(uint256)", 100)
        );
        emit Response(success, data);
    }

    function testCallDoesNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );

        emit Response(success, data);
    }
}

interface Callee {
    function getValue(uint256 initialValue) external returns (uint256);

    function storeValue(uint256 value) external;

    function getValues() external returns (uint256);
}
