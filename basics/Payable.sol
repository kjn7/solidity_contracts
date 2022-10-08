// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable {
    address payable owner;
    //ctor is payable
    constructor() payable {
        owner = payable(msg.sender);
    }

    //call this func with some ether
    // balance will be update automatically
    function deposit() external payable {}
    function noPayable() external {} // throws error if called with some ether

    function balance() external view returns(uint) {
        return address(this).balance;
    }

    //withdraw all ether from a contract
    function withdraw() external {
        uint amount = address(this).balance;
        (bool ok, )= owner.call{value: amount}("");
        require(ok, "withdraw failed");
    }

    //transfer from contract  address to _to
    function transfer(address payable _to, uint _amount) external {
        (bool ok, ) = _to.call{value: _amount}("");
        require(ok, "failed to transfer");
    }
}
