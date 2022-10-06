// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ViewPure {
    uint private _x = 123;

    function add(uint y) public view returns(uint) {
        return _x+y;
    }
    function sum(uint x, uint y) public pure returns(uint) {
        return x+y;
    }
}
