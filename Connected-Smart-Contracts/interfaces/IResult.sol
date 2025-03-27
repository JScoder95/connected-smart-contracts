// License
// SPDX-License-Identifier: LPGL-3.0-only

// Version Solidity
pragma solidity 0.8.24;

interface IResult {
    function setResult(uint256 num_) external;
    function setFee(uint256 newFee_) external;
}