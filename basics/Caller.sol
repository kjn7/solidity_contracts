// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Callee {
    uint public x;
    uint public value;
    function setX(uint _x) external returns(uint){
        x = _x;
        return x;
    }
    function setValue(uint _x) external payable returns(uint,uint) {
        value = msg.value;
        return (_x, value);
    }
}

contract Caller {
    function setX(address _addr, uint _x) external returns(uint){
        Callee c = Callee(_addr);
        return c.setX(_x);
    }
    function setValue(address _addr, uint _x) external payable returns(uint,uint) {
        Callee c = Callee(_addr);
        (uint x, uint y) = c.setValue{value:msg.value/2}(_x);
        return (x,y);
    }
}
