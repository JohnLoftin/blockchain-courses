// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SimpleMappingExample {
    mapping(uint256 => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint256 => mapping(uint256 => bool)) uintUintBoolMapping;

    function setUintUintBoolMapping(
        uint256 _index1,
        uint256 _index2,
        bool _value
    ) public {
        uintUintBoolMapping[_index1][_index2] = _value;
    }

    function getUintUintBoolMapping(uint256 _index1, uint256 _index2)
        public
        view
        returns (bool)
    {
        return uintUintBoolMapping[_index1][_index2];
    }

    function setValue(uint256 _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}
