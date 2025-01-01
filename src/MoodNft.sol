// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    string private sadSvg;
    string private happySvg;
    uint256 private s_tokenCounter;

    enum Mood {
        HAPPY,
        SAD
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    //here , svg is storing on onchain
    constructor(string memory _sadSvg, string memory _happySvg) ERC721("MoodNft", "MOOD") {
        sadSvg = _sadSvg;
        happySvg = _happySvg;

        s_tokenCounter = 0;
    }

    function mintNFT() public returns (uint256) {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;

        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            imageURI = happySvg;
        } else {
            imageURI = sadSvg;
        }

        //concating the metadata of the nft
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode( //convert to base64
                    bytes(
                        abi.encodePacked( //convert to bytes
                            '{"name: "',
                            name(),
                            '", description: "An NFT that reflects your mood!", "attributes": [{"trait_type": "Mood", "value": 100}], "image": ',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }
}
