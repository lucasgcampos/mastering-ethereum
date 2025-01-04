// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Owner} from "./Owner.sol";

contract Mortal is Owner {
    
    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }
}