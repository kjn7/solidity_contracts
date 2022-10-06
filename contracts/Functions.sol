// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Functions {
    function returnMany() public pure returns(uint, bool) {
        return (123, true);
    }
    
    function returnMany2() public pure returns(uint x, uint y)  {
        return (100, 200);
    }

    function returnManyA() public pure returns(uint x, uint y) {
        x = 21;
        y = 22;
    }

    function returnManyB() public pure returns (uint x,uint y, uint z) {
        (uint i,) = returnManyA();
        (uint j,,uint k) = (1,3,4);
        return (i,j,k);
    }
    function returnManyB2(uint x, uint y) public pure returns(uint, uint) {
        return (x*2, y*2);
    }
    function returnManyC() public pure returns(uint _x, uint _y) {
        return returnManyB2({x: _x, y: _y});
    }

    //array as input&output

    uint[] public ary;

    function arrayInput(uint[] memory _arr) public {
        for (uint i = 0; i < _arr.length; i++) {
            ary.push(_arr[i]);
        }
    }

    function arrayOutput() public view returns(uint[] memory) {
        return ary;
    }
}
