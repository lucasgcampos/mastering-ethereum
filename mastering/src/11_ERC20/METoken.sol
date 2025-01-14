// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract METoken is ERC20 {
    
    constructor() ERC20("Mastering Ethereum Token", "MET") {
       
    }
}