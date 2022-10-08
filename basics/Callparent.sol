// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    event Log(string message);

    function func1() public virtual {
        emit Log("func1.A called");
    }
    function func2() public virtual {
        emit Log("func2.A called");
    }
}

contract B is A {
    function func1() public virtual override {
        emit Log("func1.B called");
        A.func1();
    }
    function func2() public virtual override {
        emit Log("func2.B called");
        super.func2();
    }
}

contract C is A {
  
    function func1() public virtual override {
        emit Log("func1.C called");
        A.func1();
    }
    function func2() public virtual override {
        emit Log("func2.C called");
        super.func2();
    }
}

contract D is B,C {
    //C A
    function func1() public override(B,C) {
        super.func1();
    }
    //C B A
    function func2() public override(B,C) {
        super.func2();
    }
}
