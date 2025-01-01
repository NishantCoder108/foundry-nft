//SPDX-License-Identifer: MIT

pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj4gPHRleHQgeD0iMjAwIiB5PSIyNTAiIGZpbGw9ImJsYWNrIj5IaSEgWW91IGRlY29kZWQgdGhpcyEgPC90ZXh0PiA8L3N2Zz4=";

        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"> <text x="200" y="250" fill="black">Hi! You decoded this! </text> </svg>';

        string memory actualUri = deployer.svgToImageURI(svg);

        // We can't compare strings directly , they are bytes array, so we convert them to hash

        // assert(
        //     keccak256(abi.encodePacked(expectedUri)) ==
        //         keccak256(abi.encodePacked(actualUri))
        // );

        console.log("expectedUri: %s", expectedUri);
        console.log("actualUri: %s", actualUri);

        assertEq(
            keccak256(abi.encodePacked(expectedUri)),
            keccak256(abi.encodePacked(actualUri))
        );
        // forge test --mt testConvertSvgToUri
    }
}
