// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract HashForEther { 

    function withdrawWinnings() external {
        require(uint32(uint160(msg.sender)) == 0);
        _sendWinnings();
    }

    function _sendWinnings() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}