//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract MoodNftTest is Test {
    MoodNft moodNft;
    address USER = makeAddr("USER");
    DeployMoodNft deployer;

    string public constant HAPPY_SVG_IMAGE_URI =
        "data:image/svg+xml;base64,PHN2ZwogICAgdmlld0JveD0iMCAwIDIwMCAyMDAiCiAgICB3aWR0aD0iNDAwIgogICAgaGVpZ2h0PSI0MDAiCiAgICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCj4KICAgIDxjaXJjbGUKICAgICAgICBjeD0iMTAwIgogICAgICAgIGN5PSIxMDAiCiAgICAgICAgZmlsbD0ieWVsbG93IgogICAgICAgIHI9Ijc4IgogICAgICAgIHN0cm9rZT0iYmxhY2siCiAgICAgICAgc3Ryb2tlLXdpZHRoPSIzIgogICAgLz4KICAgIDxnIGNsYXNzPSJleWVzIj4KICAgICAgICA8Y2lyY2xlIGN4PSI2MSIgY3k9IjgyIiByPSIxMiIgLz4KICAgICAgICA8Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0iMTIiIC8+CiAgICA8L2c+CiAgICA8cGF0aAogICAgICAgIGQ9Im0xMzYuODEgMTE2LjUzYy42OSAyNi4xNy02NC4xMSA0Mi04MS41Mi0uNzMiCiAgICAgICAgc3R5bGU9ImZpbGw6bm9uZTsgc3Ryb2tlOiBibGFjazsgc3Ryb2tlLXdpZHRoOiAzOyIKICAgIC8+Cjwvc3ZnPg==";

    string public constant SAD_SVG_IMG_URI =
        "data:image/svg+xml;base64,PHN2ZwogICAgdmlld0JveD0iMCAwIDIwMCAyMDAiCiAgICB3aWR0aD0iNDAwIgogICAgaGVpZ2h0PSI0MDAiCiAgICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCj4KICAgIDxjaXJjbGUKICAgICAgICBjeD0iMTAwIgogICAgICAgIGN5PSIxMDAiCiAgICAgICAgZmlsbD0ieWVsbG93IgogICAgICAgIHI9Ijc4IgogICAgICAgIHN0cm9rZT0iYmxhY2siCiAgICAgICAgc3Ryb2tlLXdpZHRoPSIzIgogICAgLz4KICAgIDxnIGNsYXNzPSJleWVzIj4KICAgICAgICA8Y2lyY2xlIGN4PSI2MSIgY3k9IjgyIiByPSIxMiIgLz4KICAgICAgICA8Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0iMTIiIC8+CiAgICA8L2c+CiAgICA8cGF0aAogICAgICAgIGQ9Ik01NSAxNDAgUTEwMCAxMTAgMTQ1IDE0MCIKICAgICAgICBzdHlsZT0iZmlsbDpub25lOyBzdHJva2U6YmxhY2s7IHN0cm9rZS13aWR0aDozOyIKICAgIC8+Cjwvc3ZnPg==";

    string public constant SAD_SVG_URI =
        "data:application/json;base64,eyJuYW1lOiAiTW9vZE5mdCIsIGRlc2NyaXB0aW9uOiAiQW4gTkZUIHRoYXQgcmVmbGVjdHMgeW91ciBtb29kISIsICJhdHRyaWJ1dGVzIjogW3sidHJhaXRfdHlwZSI6ICJNb29kIiwgInZhbHVlIjogMTAwfV0sICJpbWFnZSI6IGRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp3b2dJQ0FnZG1sbGQwSnZlRDBpTUNBd0lESXdNQ0F5TURBaUNpQWdJQ0IzYVdSMGFEMGlOREF3SWdvZ0lDQWdhR1ZwWjJoMFBTSTBNREFpQ2lBZ0lDQjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaUNqNEtJQ0FnSUR4amFYSmpiR1VLSUNBZ0lDQWdJQ0JqZUQwaU1UQXdJZ29nSUNBZ0lDQWdJR041UFNJeE1EQWlDaUFnSUNBZ0lDQWdabWxzYkQwaWVXVnNiRzkzSWdvZ0lDQWdJQ0FnSUhJOUlqYzRJZ29nSUNBZ0lDQWdJSE4wY205clpUMGlZbXhoWTJzaUNpQWdJQ0FnSUNBZ2MzUnliMnRsTFhkcFpIUm9QU0l6SWdvZ0lDQWdMejRLSUNBZ0lEeG5JR05zWVhOelBTSmxlV1Z6SWo0S0lDQWdJQ0FnSUNBOFkybHlZMnhsSUdONFBTSTJNU0lnWTNrOUlqZ3lJaUJ5UFNJeE1pSWdMejRLSUNBZ0lDQWdJQ0E4WTJseVkyeGxJR040UFNJeE1qY2lJR041UFNJNE1pSWdjajBpTVRJaUlDOCtDaUFnSUNBOEwyYytDaUFnSUNBOGNHRjBhQW9nSUNBZ0lDQWdJR1E5SWswMU5TQXhOREFnVVRFd01DQXhNVEFnTVRRMUlERTBNQ0lLSUNBZ0lDQWdJQ0J6ZEhsc1pUMGlabWxzYkRwdWIyNWxPeUJ6ZEhKdmEyVTZZbXhoWTJzN0lITjBjbTlyWlMxM2FXUjBhRG96T3lJS0lDQWdJQzgrQ2p3dmMzWm5QZz09In0=";
    //Here we will pass two svg strings to the constructor of MoodNft
    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }

    function testViewTokenURIIntegration() public {
        vm.prank(USER);
        moodNft.mintNFT();
        console.log(moodNft.tokenURI(0));

        // forge test --mt testViewTokenURIIntegration
    }

    function testFlipMoodIntegration() public {
        //when we write `vm.prank` only next tab will be selected as a user
        vm.prank(USER);
        moodNft.mintNFT();

        vm.prank(USER);
        moodNft.flipMood(0);

        assertEq(
            keccak256(abi.encodePacked(moodNft.tokenURI(0))),
            keccak256(abi.encodePacked(SAD_SVG_URI))
        );

        // forge test --mt testFlipMoodIntegration
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

    function testFlipMood() public {
        //startprank is used to set the owner continuously
        vm.startPrank(USER);
        moodNft.mintNFT();

        string memory initial_token_uri = moodNft.tokenURI(0);
        console.log(initial_token_uri);

        moodNft.flipMood(0);
        string memory flip_token_uri = moodNft.tokenURI(0);

        console.log(flip_token_uri);
        vm.assertNotEq(initial_token_uri, flip_token_uri);
    }
}
