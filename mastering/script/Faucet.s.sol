// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {Faucet} from "../src/01_Faucet.sol";

contract FaucetScript is Script {
    Faucet faucet;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        faucet = new Faucet();
        vm.stopBroadcast();
    }
}
