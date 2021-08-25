pragma solidity ^0.8.4;

contract WorkingWithVariables {
    uint256 public myUint;

    function setMyUint(uint256 _myUint) public {
        myUint = _myUint;
    }
}
