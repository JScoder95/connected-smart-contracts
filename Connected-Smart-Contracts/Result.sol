// License
// SPDX-License-Identifier: LPGL-3.0-only

// Version Solidity
pragma solidity 0.8.24;

// Contract
contract Result {

    uint256 public result;

    //  word (function) + name + args +  visibility + modifiers + return value
    function setResult(uint256 num_) external {
       result = num_;
    }

} 

    