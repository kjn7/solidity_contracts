// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function f() public pure virtual returns(string memory) {
        return "this is A";
    }
}
contract AA {

}
contract B is A {
    function f() public pure virtual override returns(string memory) {
        return "this is B";
    }
}
contract C is A {
    function f() public pure virtual override returns(string memory) {
        return "this is C";
    }
}
//C.f() called
contract D is B,C {
    function f() public pure override(B,C) returns (string memory) {
        return super.f();
    }
}
//order - from most base-like to most derived
contract F is A,B {
    function f() public pure override(A,B) returns(string memory) {
        return "thsi is F";
    }
}
