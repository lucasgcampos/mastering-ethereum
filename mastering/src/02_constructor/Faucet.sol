// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Faucet {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    function withdraw(uint withdraw_amount) external {
        require(withdraw_amount <= 0.1 ether);
        payable(msg.sender).transfer(withdraw_amount);
    }

    function balance() view external returns(uint) {
        return address(this).balance;
    }

    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    receive() external payable {}
}
