// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage {
    SimpleStorage[] public slist;
    
    function createSimpleStorage() public {
        SimpleStorage s = new SimpleStorage();
        slist.push(s);
    }
    function myStore(uint256 _index, uint256 _num) public {
        SimpleStorage(address(slist[_index])).store(_num);
    }

    function myGet(uint256 _index) public view returns (uint256){
        return SimpleStorage(address(slist[_index])).retrieve();
    }
}
