// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    function internalFunc() internal pure returns(string memory) {
        return "internalFunc call";
    }
    function privateFunc() private pure returns(string memory) {
        return "privateFunc call";
    }
}

contract Child is Base {
    function callInternal()  public pure returns(string memory) {
        return internalFunc();
    }
    function callPrivate() public pure returns(string memory) {
       // return privateFunc(); //wont compile
       return "noway";
    }
}
