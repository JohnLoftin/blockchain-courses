// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract MappingStructExample {
    struct Payment {
        uint256 amount;
        uint256 timestamp;
    }

    struct Balance {
        uint256 totalBalance;
        uint256 numPayments;
        mapping(uint256 => Payment) payments;
    }

    mapping(address => Balance) public balanceRecieved;

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceRecieved[msg.sender].totalBalance += msg.value;

        Payment memory payment = Payment(msg.value, block.timestamp);

        balanceRecieved[msg.sender].payments[
            balanceRecieved[msg.sender].numPayments
        ] = payment;
        balanceRecieved[msg.sender].numPayments++;
    }

    function withdrawMoney(address payable _to, uint256 _amount) public {
        require(
            balanceRecieved[msg.sender].totalBalance >= _amount,
            "not enough funds"
        );
        balanceRecieved[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }

    function withdrawAllMoney(address payable _to) public {
        uint256 balanceToSend = balanceRecieved[msg.sender].totalBalance;
        balanceRecieved[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    }
}
