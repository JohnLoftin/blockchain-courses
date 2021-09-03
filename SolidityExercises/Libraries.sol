// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract LibrariesExample {
    using SafeMath for uint256;

    mapping(address => uint256) public tokenBalance;

    constructor() public {
        tokenBalance[msg.sender] = tokenBalance[msg.sender].add(1);
    }

    function sendToken(address _to, uint256 _amount)
        public
        payable
        returns (bool)
    {
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_to] = tokenBalance[_to].add(_amount);

        return true;
    }
}
