// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ImportBase.sol";

contract Testit {
    function addXY(uint _x, uint _y) external pure returns(uint) {
        return add(_x,_y);
    }
}
