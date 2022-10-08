// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {
    uint256 public number;

    struct People {
        uint256 number;
        string name;
    }

    People[] public parray;
    mapping(string => uint256) public pmap;

    function store(uint256 _number ) public {
        number = _number;
    }
    function retrieve() public view returns (uint256) {
        return number;
    }
    function addPerson(string memory _name, uint256 _number) public {
        parray.push(People(_number, _name));
        pmap[_name] = _number;
    }
}
