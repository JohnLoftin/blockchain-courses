// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SendMoneyExample {
    uint256 public balanceRecieved;
    address public owner;

    function receiveMoney() public payable {
        balanceRecieved += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        payable(owner).transfer(this.getBalance());
    }

    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}
