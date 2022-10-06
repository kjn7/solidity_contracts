// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Errors {
    function testRequire(uint _i) public pure {
        require(_i > 10, "should be > 10");
    }
    function testRevert(uint _i) public pure {
        if (_i <= 10) {
            revert("revert: should be > 10");
        }
    }
    function testAssert() public pure {
        assert(false);
    }

    //custom error
    error MyError(uint balance, uint amount);
    
    function testError(uint _amount) public view {
        uint bal = address(this).balance;
        if (bal < _amount) {
            revert MyError({balance: bal, amount: _amount});
        }
    }
}
