// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Todos {
    struct Todo {
        string text;
        bool done;
    }

    Todo[] public ta;

    function create(string calldata _text) public {
        ta.push(Todo({text:_text, done:false}));
    }

    function updateText(uint _index, string calldata _text) public {
        require(_index < ta.length, "bad index");
        ta[_index].text = _text;
    }
    function updateDone(uint _index) public {
        require(_index < ta.length, "bad index");
        ta[_index].done = !ta[_index].done;
    }
}
