// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Mortal} from "./Mortal.sol";

contract Faucet is Mortal {

    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    function withdraw(uint withdraw_amount) external {
        require(withdraw_amount <= 0.1 ether);
        require(this.balance() >= withdraw_amount, "Insufficient balance in faucet for withdrawal request");
        payable(msg.sender).transfer(withdraw_amount);
        emit Withdrawal(msg.sender, withdraw_amount);
    }

    function balance() view external returns(uint) {
        return address(this).balance;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }
}
