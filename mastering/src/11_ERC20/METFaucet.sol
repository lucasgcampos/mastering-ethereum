// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract METFaucet {
    ERC20 public METoken;
    address public METOwner;

    constructor(address _METoken, address _METOwner) {
        METoken = ERC20(_METoken);
        METOwner = _METOwner;
    }

    function withdraw(uint _withdrawAmount) external {
        require(_withdrawAmount <= 1000);

        METoken.transferFrom(METOwner, msg.sender, _withdrawAmount);
    }

    function receiver() public payable { revert(); }
}