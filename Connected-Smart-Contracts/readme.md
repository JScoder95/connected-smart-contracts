# Interacting Contracts: Addition and Result with Fee Management

This README.md explains the functionality of the `Result`, `AdditionContract`, and `IResult` Solidity contracts, showcasing how they interact and manage a fee.

## Overview

* **`Result.sol`**: A contract that stores a result, manages an admin, and sets a fee.
* **`AdditionContract.sol`**: A contract that performs addition and interacts with the `Result` contract to store the result and set the fee.
* **`IResult.sol`**: An interface that defines the functions that `Result.sol` implements, allowing `AdditionContract` to interact with it.

## `IResult.sol` - Interface Definition

```solidity
// License
// SPDX-License-Identifier: LPGL-3.0-only

// Version Solidity
pragma solidity 0.8.24;

interface IResult {
    function setResult(uint256 num_) external;
    function setFee(uint256 newFee_) external;
}
Defines an interface IResult with two functions:
setResult(uint256 num_) external: Sets the result.
setFee(uint256 newFee_) external: Sets the fee.
Interfaces allow contracts to interact without knowing implementation details.
Result.sol - Result Storage and Fee Management Contract
Solidity

## `Result.sol` - Result Smart Contract Definition

// License
// SPDX-License-Identifier: LPGL-3.0-only

// Version Solidity
pragma solidity 0.8.24;

// Contract
contract Result {

    uint256 public result;
    address public admin;
    uint256 public fee;

    constructor(address admin_) {
        admin = admin_;
        fee = 5;
    }

    function setResult(uint256 num_) external {
       result = num_;
    }

     function setFee(uint256 newFee_) external {
        if (tx.origin != admin) revert();
        fee = newFee_;
    }

}
Stores result, admin, and fee state variables.
Constructor initializes admin and sets fee to 5.
setResult() sets the result variable.
setFee() allows only the admin to change the fee.
AdditionContract.sol - Addition and Interaction Contract
Solidity

## `Addition.sol` - Addition Smart Contract Definition

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

## `Step to Step` 

Imports IResult to interact with the Result contract.
Constructor takes the Result contract's address.
addition() adds two numbers and stores the result in the Result contract.
setFee() forwards the fee change request to the Result contract.
Interaction Flow
Deployment:
Deploy Result.sol first.
Deploy AdditionContract.sol, providing the Result contract's address.
Addition:
Call addition() on AdditionContract.sol.
The result is stored in Result.sol.
Fee Management:
Call setFee() on AdditionContract.sol.
The request is forwarded to Result.sol.
Only the admin can successfully change the fee.
Retrieval:
Call result and fee on Result.sol to retrieve stored values.
Key Concepts
Interfaces: Enable standardized contract interaction.
Contract Interaction: Contracts can call functions of other contracts using interfaces.
Access Control: Only the admin can modify the fee.
External Functions: Functions callable from outside the contract.
Running in Remix
Compile: Compile all contracts.
Deploy Result.sol: Note the contract address.
Deploy AdditionContract.sol: Provide the Result contract address.
Interact:
Call addition() on AdditionContract.
Call result on Result to see the result.
Call setFee() on AdditionContract.
Call fee on Result to see the changed fee.