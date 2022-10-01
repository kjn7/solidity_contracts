#!/usr/bin/env python3
#send ether to another account

from web3 import Web3
w3 = Web3(Web3.HTTPProvider('http://127.0.0.1:7545'))

sender = '0x4FF5851DB57f8F13538b040e433570Ec036af994'
receiver = '0xb6b6048fab7754C1347C9CBf56063B669F467877'

privkey = '<KEY>'

nonce = w3.eth.getTransactionCount(sender)

tx = {
	'nonce':nonce, 
	'to':receiver, 
	'value': w3.toWei(2,'ether'),
	'gas': 300000,
	'gasPrice': w3.toWei(50,'gwei')
}

signed_tx = w3.eth.account.signTransaction(tx, privkey)
r = signed_tx.rawTransaction
tx_hash = w3.eth.sendRawTransaction(r)
print(w3.toHex(tx_hash))


