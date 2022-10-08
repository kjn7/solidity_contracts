// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    address public owner;

    constructor(address _owner)  {
        require(_owner != address(0),"bad address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }
    function func(uint _x) external pure returns(string memory) {
        require(_x!=0, "bad x");
        return "func called";
    }
}

contract B {
    event Log(string msg);
    A public a;

    constructor () {
        a = new A(msg.sender);
    }
    //try/catch externa call
    // call with 0 and 1 to test
    function tryExternalCall(uint _i) external {
        try a.func(_i) returns (string memory result) {
            emit Log(result);
        } catch Error (string memory e) {
            emit Log(e);
        }
    }

    function tryNewA(address _addr) external {
        try new A(_addr) returns (A) {
            emit Log("created A");
        }catch Error (string memory e) {
            emit Log(e); //revert/require failed
        } catch (bytes memory){
            emit Log("assert failed");
        }
    } 
}
