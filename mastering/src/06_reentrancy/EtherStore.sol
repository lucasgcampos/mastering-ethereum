// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EtherStore {

    uint public withdrawalLimit = 1 ether;
    mapping(address => uint) public lastWithdrawTime;
    mapping(address => uint) public balances;

    function depositFunds() public payable() {
        balances[msg.sender] += msg.value;
    }

    function withdrawFunds(uint _weiToWithdraw) public {
        // has balance
        require(balances[msg.sender] >= _weiToWithdraw);

        // limit withdraw
        require(_weiToWithdraw <= withdrawalLimit);

        // time allowed
        require(now >= lastWithdrawTime + 1 weeks);

        require(msg.sender.call.value(_weiToWithdraw)());
        balances[msg.sender] -= _weiToWithdraw;
        lastWithdrawTime[msg.sender] = now;
    }
}