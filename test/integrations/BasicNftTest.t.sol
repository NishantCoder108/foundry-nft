//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import {BasicNft} from "../../src/BasicNft.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    BasicNft public basicNft;
    DeployBasicNft public deployer;

    address public user = makeAddr("user");
    string public constant TOKENURI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

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

    function testCanMintAndBalance() public {
        address account1 = makeAddr("Ram");
        address account2 = makeAddr("shayam");

        //minting token for account
        vm.prank(account1);
        basicNft.mintNFT(TOKENURI);

        vm.prank(account2);
        basicNft.mintNFT(TOKENURI);

        assert(basicNft.balanceOf(account1) == 1);
        assert(basicNft.balanceOf(account2) == 1);
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(user);
        basicNft.mintNFT(TOKENURI);

        assert(basicNft.balanceOf(user) == 1);
        assert(
            keccak256(abi.encodePacked(TOKENURI)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
