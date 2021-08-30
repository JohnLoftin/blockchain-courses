// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.3;

contract DebuggerExample {
    uint256 public myUint;

    function setMyUint(uint256 _myuint) public {
        myUint = _myuint;
    }
}
