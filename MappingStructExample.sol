// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract MappingStructExample {
    mapping(address => uint256) public balanceRecieved;

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceRecieved[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint256 _amount) public {
        require(balanceRecieved[msg.sender] >= _amount, "not enough funds");
        balanceRecieved[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function withdrawAllMoney(address payable _to) public {
        uint256 balanceToSend = balanceRecieved[msg.sender];
        balanceRecieved[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }
}
