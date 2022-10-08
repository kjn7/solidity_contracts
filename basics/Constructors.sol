// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base1 {
    string public name1;
    constructor (string memory _name) {
        name1 = _name;
    }
}

contract Base2 {
    string public name2;
    constructor(string memory _name) {
        name2 = _name;
    }
}


contract Derived2 is Base1, Base2 {
    constructor(string memory _name1, string memory _name2) Base1(_name1) Base2(_name2) {

    }
}
