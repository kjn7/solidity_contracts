// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
  function totalSupply() external view returns (uint256);

  function balanceOf(address who) external view returns (uint256);

  function allowance(address owner, address spender) external view returns (uint256);

  function transfer(address to, uint256 value) external returns (bool);

  function approve(address spender, uint256 value)
    external returns (bool);

  function transferFrom(address from, address to, uint256 value)
    external returns (bool);

  event Transfer(
    address indexed from,
    address indexed to,
    uint256 value
  );

  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

contract ERC20 is IERC20 {
    uint256 public totalSupply;
    string public name;
    string public symbol;

    mapping(address => uint256) private balance;
    mapping(address => mapping(address => uint256)) private allow;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        _mint(msg.sender, 100e18);
    }

    function transfer(address _to, uint256 _amount) public returns(bool) {
        require(_to != address(0),"bad address");
        require(_amount <= balance[msg.sender],"not enough funds");
        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    function balanceOf(address _owner) public view returns(uint256) {
        return balance[_owner];
    }

    function allowance(address _owner, address _spender) public view returns(uint256) {
        return allow[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _amount) public returns(bool) {
        require(_to != address(0),"bad address");
        require(_amount <= balance[_from],"bad balance");
        require(_amount <= allow[_from][msg.sender], "not allowed");

        balance[_from] -= _amount;
        balance[_to] += _amount;
        allow[_from][msg.sender] -= _amount;

        emit Transfer(_from, _to, _amount);

        return true;
    }

    function approve(address _spender, uint256 _amount) external returns(bool) {
        require(_spender != address(0), "bad address");
        allow[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function decimals() external pure returns(uint256) {
        return 18;
    }

    function _mint(address _to, uint256 _amount) internal {
        require(_to != address(0),"bad address");
        totalSupply += _amount;
        balance[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }
}
