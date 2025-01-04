// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Mortal} from "./Mortal.sol";

contract Faucet is Mortal {

    function withdraw(uint withdraw_amount) external {
        require(withdraw_amount <= 0.1 ether);
        payable(msg.sender).transfer(withdraw_amount);
    }

    function balance() view external returns(uint) {
        return address(this).balance;
    }

    receive() external payable {}
}
