// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Car {
    address public owner;
    address public addr;
    string public model;

    constructor(address _owner, string memory _model) payable {
        addr = address(this);
        owner = _owner;
        model = _model;
    }
}

contract Factory {
    Car[] public cars;

    function create(address _owner, string memory _model) external {
        Car car = new Car(_owner, _model);
        cars.push(car);
    }

    function createPayable(address _owner, string memory _model) external payable {
        Car car = (new Car){value:msg.value}(_owner, _model);
        cars.push(car);
    }

    function create2(address _owner, string memory _model, bytes32 _salt) external {
        Car car = (new Car){salt:_salt}(_owner,_model);
        cars.push(car);
    }
    function create2Payable(address _owner, string memory _model, bytes32 _salt) external payable {
        Car car = (new Car){salt:_salt, value:msg.value}(_owner, _model);
        cars.push(car);
    }

    function getCar(uint index) external view returns(address owner, string memory model, address cc, uint balance) {
        Car c = cars[index];
        return (c.owner(), c.model(), c.addr(), address(c).balance);
    }
}
