// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping (address => bool) wavers;
    uint32 uniqueWavers;

    constructor() {
        console.log("Just setting up my cntrct");
    }

    function wave() public {
        totalWaves++;

        if(!wavers[msg.sender]) {
            wavers[msg.sender] = true;
            uniqueWavers++;
        }

        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves from %d unique wavers!", totalWaves, uniqueWavers);
        return totalWaves;
    }
} 