// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


//simple wallet
//anyone can send ether
//only owner can withdraw
contract MyWallet {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}
    
    function recvether() external payable {
        
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

    function withdraw(uint _amount) external {
        require(owner == msg.sender, "not owner");
        payable(msg.sender).transfer(_amount);
    }
}
