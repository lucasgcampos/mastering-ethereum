// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Lotto {
    bool public payedOut = false;
    address public winner;
    uint public winAmount;

    function sendToWinner() public {
        require(!payedOut);
        bool response = payable(winner).send(winAmount);
        require(response);
        payedOut = true;
    }

    function withdrawLeftOver() public {
        require(payedOut);
        payable(msg.sender).send(address(this).balance);
    }
}