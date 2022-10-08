// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiveEther {
    // msg.data empty
    receive() external payable {}
    //msg.data is not empty
    fallback() external payable {
        require(false,"fallback called");
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(msg.value);
    }
    function sendViaSend(address payable _to) external payable {
        bool ok = _to.send(msg.value);
        require(ok, "failed to send");
    }
    function sendViaCall(address payable _to) external payable {
        (bool ok, ) = _to.call{value: msg.value}("11");
        require(ok,"failed to call");
    }
}
