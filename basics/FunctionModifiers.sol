// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionModifiers {
    uint public x =4;
    address public owner;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    //verify access
    modifier onlyOwner() {
        require(msg.sender == owner, "only owner");
        _; //execute the rest
    }

    modifier checkAddress(address _a) {
        require(_a != address(0),"bad address");
        _;
    }

    function changeOwner(address _a) public onlyOwner checkAddress(_a) {
        owner = _a;
    }
    
    modifier noReentrancy() {
        require(!locked, "no reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy returns(uint) {
        x -= i;
        if (i > 1) {
            //should fail here
            return decrement(i - 1); 
        }
        return x;
    }
}
