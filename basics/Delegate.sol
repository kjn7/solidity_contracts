// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract B {
    uint public num;
    address public sender;
    uint public value;

    function set(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

//contract B code is executed
// with contract A's storage
contract A {
    uint public num;
    address public sender;
    uint public value;

    function set(address _addr, uint _num) external payable {
        (bool ok,) = _addr.delegatecall(
            abi.encodeWithSignature("set(uint256)",_num)
        );
        require(ok, "failed to call");
    }
}
