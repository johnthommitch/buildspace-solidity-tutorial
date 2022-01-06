// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract ChickenFarm {
    uint256 chickenCount;
    mapping (address => bool) chickenOwners;
    uint32 uniqueChickenOwners;

    constructor() {
        console.log("Just setting up my cntrct");
    }

    function hatch() public {
        chickenCount++;

        if(!chickenOwners[msg.sender]) {
            chickenOwners[msg.sender] = true;
            uniqueChickenOwners++;
        }

        console.log("%s has hatched a chicken!", msg.sender);
    }

    function getChickenCount() public view returns (uint256) {
        console.log("We have hatched %d total chickens from %d unique farmers!", chickenCount, uniqueChickenOwners);
        return chickenCount;
    }
}