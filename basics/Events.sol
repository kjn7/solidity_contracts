// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Events {
    event Log(address indexed adr, string message);
    event AnotherLog();

    function log() public {
        emit Log(msg.sender, "hello there");
        emit AnotherLog();
    }
}
