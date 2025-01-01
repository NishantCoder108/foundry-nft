//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract MoodNftTest is Test {
    MoodNft moodNft;
    address USER = makeAddr("USER");
    string public constant HAPPY_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZwogICAgdmlld0JveD0iMCAwIDIwMCAyMDAiCiAgICB3aWR0aD0iNDAwIgogICAgaGVpZ2h0PSI0MDAiCiAgICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCj4KICAgIDxjaXJjbGUKICAgICAgICBjeD0iMTAwIgogICAgICAgIGN5PSIxMDAiCiAgICAgICAgZmlsbD0ieWVsbG93IgogICAgICAgIHI9Ijc4IgogICAgICAgIHN0cm9rZT0iYmxhY2siCiAgICAgICAgc3Ryb2tlLXdpZHRoPSIzIgogICAgLz4KICAgIDxnIGNsYXNzPSJleWVzIj4KICAgICAgICA8Y2lyY2xlIGN4PSI2MSIgY3k9IjgyIiByPSIxMiIgLz4KICAgICAgICA8Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0iMTIiIC8+CiAgICA8L2c+CiAgICA8cGF0aAogICAgICAgIGQ9Im0xMzYuODEgMTE2LjUzYy42OSAyNi4xNy02NC4xMSA0Mi04MS41Mi0uNzMiCiAgICAgICAgc3R5bGU9ImZpbGw6bm9uZTsgc3Ryb2tlOiBibGFjazsgc3Ryb2tlLXdpZHRoOiAzOyIKICAgIC8+Cjwvc3ZnPg==";

    string public constant SAD_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZwogICAgdmlld0JveD0iMCAwIDIwMCAyMDAiCiAgICB3aWR0aD0iNDAwIgogICAgaGVpZ2h0PSI0MDAiCiAgICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCj4KICAgIDxjaXJjbGUKICAgICAgICBjeD0iMTAwIgogICAgICAgIGN5PSIxMDAiCiAgICAgICAgZmlsbD0ieWVsbG93IgogICAgICAgIHI9Ijc4IgogICAgICAgIHN0cm9rZT0iYmxhY2siCiAgICAgICAgc3Ryb2tlLXdpZHRoPSIzIgogICAgLz4KICAgIDxnIGNsYXNzPSJleWVzIj4KICAgICAgICA8Y2lyY2xlIGN4PSI2MSIgY3k9IjgyIiByPSIxMiIgLz4KICAgICAgICA8Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0iMTIiIC8+CiAgICA8L2c+CiAgICA8cGF0aAogICAgICAgIGQ9Ik01NSAxNDAgUTEwMCAxMTAgMTQ1IDE0MCIKICAgICAgICBzdHlsZT0iZmlsbDpub25lOyBzdHJva2U6YmxhY2s7IHN0cm9rZS13aWR0aDozOyIKICAgIC8+Cjwvc3ZnPg==";
    //Here we will pass two svg strings to the constructor of MoodNft
    function setUp() public {
        moodNft = new MoodNft(SAD_SVG_URI, HAPPY_SVG_URI);
    }

    function testViewTokenURI() public {
        vm.prank(USER);
        moodNft.mintNFT(); //mint a nft

        console.log(moodNft.tokenURI(0));

        /**
        Test command : 
        forge test --mt testViewTokenURI -vvvv
        */
    }
}
