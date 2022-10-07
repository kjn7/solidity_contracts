// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math {
    function mul(uint _x, uint _y) internal pure returns(uint) {
        return _x * _y;
    }
}
contract A {
    function test(uint _x, uint _y) public pure returns(uint) {
        return Math.mul(_x, _y);
    }
}
