// License
// SPDX-License-Identifier: LPGL-3.0-only

// Version Solidity
pragma solidity 0.8.24;

import "./interfaces/IResult.sol";

// Contract
contract AdditionContract {

    // Initialize Object : Interface( address )
    address public result;

    constructor (address result_) {
        result = result_;
    }

    function addition(uint256 num1_, uint256 num_2) external {
        uint256 result_ = num1_ + num_2;
        IResult(result).setResult(result_);
    }

     function setFee(uint256 newFee_) external {
       IResult(result).setFee(newFee_);
    }
}