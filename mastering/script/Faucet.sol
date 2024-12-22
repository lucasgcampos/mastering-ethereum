// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";

contract FaucetScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
    }
}
