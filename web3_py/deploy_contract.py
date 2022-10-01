#!/usr/bin/env python3
# deploy contract and call some methods

from web3 import Web3
from solcx import compile_source

src="""
pragma solidity ^0.8.0;

contract Hello {
	string name;
	
	constructor() public {
		name = "hellothere!";
	}
	function setName(string memory _name) public {
		name = _name;
	}
	function getName() public returns (string memory) {
		return name;
	}
}
"""

compiled = compile_source(src,output_values=['abi','bin'])
cid, cif = compiled.popitem()
abi,bytecode = cif['abi'], cif['bin']

w3 = Web3(Web3.HTTPProvider('http://127.0.0.1:7545'))

w3.eth.default_account = w3.eth.accounts[0]

hello = w3.eth.contract(abi=abi, bytecode=bytecode)

tx_hash = hello.constructor().transact()
tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)

contract = w3.eth.contract(address = tx_receipt.contractAddress, abi=abi)
tx_hash = contract.functions.setName("how are you?").transact()
tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)

s = contract.functions.getName().call()
print (s)
