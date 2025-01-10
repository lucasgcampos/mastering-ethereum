// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EtherStore {

    bool reEntrancyMutex = false;
    uint public withdrawalLimit = 1 ether;
    mapping(address => uint) public lastWithdrawTime;
    mapping(address => uint) public balances;

    function depositFunds() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdrawFunds(uint _weiToWithdraw) public {
        // 3. Check reEntrancy variable
        require(!reEntrancyMutex);

        // 2. Change variables first
        balances[msg.sender] -= _weiToWithdraw;
        lastWithdrawTime[msg.sender] = block.timestamp;

        // has balance
        require(balances[msg.sender] >= _weiToWithdraw);

        // limit withdraw
        require(_weiToWithdraw <= withdrawalLimit);

        // time allowed
        require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 weeks);

        reEntrancyMutex = true;

        // 1. Using built-in transter 
        payable(msg.sender).transfer(_weiToWithdraw);

        reEntrancyMutex = false;
    }
}