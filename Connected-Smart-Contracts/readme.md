---
title: Interacting Contracts - Addition and Result
---

# Interacting Contracts: Addition and Result

This workspace demonstrates how to create and interact between two Solidity contracts, `AdditionContract` and `Result`, using an interface `IResult`.

## Files Overview

* **`Addition.sol`**: This contract performs an addition operation and stores the result in another contract.
* **`Result.sol`**: This contract stores the result of an operation.
* **`IResult.sol`**: This interface defines the functions that `Result.sol` implements, allowing `AdditionContract` to interact with it.

## `IResult.sol` - Interface Definition

```solidity
// License
// SPDX-License-Identifier: LPGL-3.0-only

// Version Solidity
pragma solidity 0.8.24;

interface IResult {
    function setResult(uint256 num_) external;
}
This file defines an interface IResult.
An interface declares function signatures without providing their implementation.
IResult declares the function setResult, which takes a uint256 and is external. This means it can be called from outside the contract.
Interfaces are used to allow contracts to interact with each other in a standardized way.
Result.sol - Result Storage Contract
Solidity

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
This contract, Result, stores a uint256 value named result.
The setResult function sets the value of result. It implements the function declared in the IResult interface.
This contract acts as a storage for the result of the addition operation.
Addition.sol - Addition Contract
Solidity

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

}
This contract, AdditionContract, performs an addition operation.
It imports the IResult interface to interact with the Result contract.
The constructor takes the address of a deployed Result contract and stores it in the result state variable.
The addition function takes two uint256 values, adds them, and then calls the setResult function of the Result contract to store the sum.
Interaction Flow
Deployment: Deploy Result.sol first, then Addition.sol, providing the Result contract's address to the AdditionContract constructor.
Addition: Call the addition function of AdditionContract with two numbers.
Result Storage: The AdditionContract calculates the sum and stores it in the Result contract via the setResult function.
Retrieval: Call the result public variable of the Result contract to retrieve the stored sum.
Running the Contracts in Remix
Compile: Compile all three Solidity files in Remix.
Deploy Result.sol: Deploy the Result contract. Note the deployed contract address.
Deploy AdditionContract.sol: Deploy the AdditionContract, providing the Result contract address as the constructor argument.
Interact: In the "Deploy & Run Transactions" tab, call the addition function of AdditionContract with two numbers. Then, call the result function of the deployed Result contract to verify the result.
Why Use Interfaces?
Interfaces ensure that contracts adhere to a specific structure, facilitating interoperability.
They allow contracts to interact without needing to know the implementation details of other contracts.
Interfaces are essential for building modular and maintainable smart contract systems.
This example illustrates a basic interaction between contracts. In real-world applications, interfaces play a critical role in creating complex and interconnected smart contract ecosystems.