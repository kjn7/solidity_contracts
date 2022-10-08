// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    string public name;
    constructor() {
        name = "this is A";
    }
}

contract B is A {
    constructor() {
        name = "this is B";
    }
}
