// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SendMoneyExample {
    uint256 public balanceRecieved;
    uint256 public lockedUntil;

    function receiveMoney() public payable {
        balanceRecieved += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawMoney() public {
        if (lockedUntil < block.timestamp) {
            address payable to = payable(msg.sender);
            to.transfer(getBalance());
        }
    }

    function withdrawMoneyTo(address payable _to) public {
        if (lockedUntil < block.timestamp) {
            _to.transfer(getBalance());
        }
    }
}
