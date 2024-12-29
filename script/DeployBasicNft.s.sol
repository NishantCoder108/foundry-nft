//SPDX-License-Identifer: MIT

pragma solidity ^0.8.28;

import {BasicNft} from "../src/BasicNft.sol";
import "forge-std/Script.sol";

contract DeployBasicNft is Script {
    function run() external returns (BasicNft) {
        vm.startBroadcast();
        BasicNft basicNft = new BasicNft();

        vm.stopBroadcast();
        return basicNft;
    }
}
