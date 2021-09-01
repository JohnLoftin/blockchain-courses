// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract WillThrow {
    function aFunction() public {
        require(false, "Error message");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);

    function catchError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            // do something if works
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
    }
}
