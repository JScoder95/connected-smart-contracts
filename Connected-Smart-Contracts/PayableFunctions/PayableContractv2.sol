// License
// SPDX-License-Identifier: LPGL-3.0-only

// Version Solidity
pragma solidity 0.8.24;


contract PayableContractv2 {

    

    //  word (function) + name + args +  visibility + payable? + modifiers + return value
    function sendEther() public payable {

    }

    function withdrawEther(uint256 amount_) public {
        // recipient + call + eth value + data
        (bool success,) = msg.sender.call{ value: amount_ }("");
        require(success, "Transfer failed");
    }

}