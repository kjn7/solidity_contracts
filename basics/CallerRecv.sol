// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Receiver {
    event Log(address sender, string msg, uint amount);

    fallback() external payable {
        emit Log(msg.sender, "fallback call", msg.value);
    }
    function func(string memory _msg, uint _x) external payable returns(uint) {
        emit Log(msg.sender, _msg, msg.value);
        return _x + 1;
    }
}

contract Caller {
    event Response(bool status, bytes data);

    function testCall(address payable _a) external payable {
        (bool ok, bytes memory data) = _a.call{value:msg.value, gas:5000}(
            abi.encodeWithSignature("func(string,uint256)","func call", 4142)
        );
        emit Response(ok, data);
    }

    function testCallNotExist(address  _a) external {
        (bool ok, bytes memory data) = _a.call(
            abi.encodeWithSignature("somefunccall()")
        );
        emit Response(ok, data);
    }
}
