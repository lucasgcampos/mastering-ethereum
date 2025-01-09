// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Faucet} from "./Faucet.sol";
import {Mortal} from "./Mortal.sol";

contract Token is Mortal {

    Faucet _faucet;

    constructor(address _contract) {
        // using a reference
        // _faucet = new Faucet(_contract);
        // _faucet.withdraw(0.1 ether);

        // using a low-level call function
        bool isOk = _contract.call("withdraw", 0.1 ether);
        if (!isOK) {
            revert("Withdrawal from faucet failed");
        }
    }

    function selfDestruction() public onlyOwner {
        _faucet.destroy();
    }
}