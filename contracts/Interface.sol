// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}

contract Counter is ICounter {
    uint private _count;

    function count() external view override returns(uint) {
        return _count;
    }
    
    function increment() external override {
        _count += 1;
    }
}

contract MyContract {
    function incrementCount(address _a) external {
        ICounter(_a).increment();
    }
    function count(address _a) external view returns(uint) {
        return ICounter(_a).count();
    }
}
