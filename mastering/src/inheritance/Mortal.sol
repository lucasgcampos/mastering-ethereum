// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Mortal is Owner {
    
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}