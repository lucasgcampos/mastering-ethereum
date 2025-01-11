// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

library SafeMath {
    function add(uint _a, uint _b) internal pure returns (uint) {
        uint c = _a + _b;
        assert(c >= _a);
        return c;
    }
}

contract TimeLock {

    using SafeMath for uint;

    mapping(address => uint) public balances;
    mapping(address => uint) public lockTime;

    function deposit() public payable {
        balances[msg.sender].add(msg.value);
        lockTime[msg.sender] += block.timestamp.add(1 weeks);
    }

    function increaseLockTime(uint _secondsToIncrease) view public {
        lockTime[msg.sender].add(_secondsToIncrease);
    }

    function withdraw() public {
        require(balances[msg.sender] > 0);
        require(block.timestamp > lockTime[msg.sender]);
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(balances[msg.sender]);
    }
}
