// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hashfunc {
    function gethash(string memory _text, string memory _data) public pure returns(bytes32) {
        return keccak256(
            abi.encodePacked(_text, _data)
        );
    }
    // magic is Solidity
    bytes32 magic = 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;
    function guess(string memory _word) public view returns(bool) {
        return keccak256(abi.encodePacked(_word)) == magic;
    }
}
