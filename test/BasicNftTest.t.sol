//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    BasicNft public basicNft;
    DeployBasicNft public deployer;

    // Setup of test
    function setUp() public {
        //Deployed contract
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Doggie";
        string memory actualName = basicNft.name();

        // assertEq(actualName, expectedName);

        //abi.encodePacked will convert to bytes
        //keccak256 will hash the bytes into bytes32

        assert(
            keccak256(abi.encodePacked(actualName)) ==
                keccak256(abi.encodePacked(expectedName))
        );
    }
}
