# Contract :

###  Contract Deployed at https://sepolia.etherscan.io/address/0x21aA0ecb3F3f54CD68F7982Dc81c44e42E770fE3#readContract

---
#### - Happy SVG Base64 Image: 
```bash

data:image/svg+xml;base64,    PHN2ZwogICAgdmlld0JveD0iMCAwIDIwMCAyMDAiCiAgICB3aWR0aD0iNDAwIgogICAgaGVpZ2h0
PSI0MDAiCiAgICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCj4KICAgIDxjaXJj
bGUKICAgICAgICBjeD0iMTAwIgogICAgICAgIGN5PSIxMDAiCiAgICAgICAgZmlsbD0ieWVsbG93
IgogICAgICAgIHI9Ijc4IgogICAgICAgIHN0cm9rZT0iYmxhY2siCiAgICAgICAgc3Ryb2tlLXdp
ZHRoPSIzIgogICAgLz4KICAgIDxnIGNsYXNzPSJleWVzIj4KICAgICAgICA8Y2lyY2xlIGN4PSI2
MSIgY3k9IjgyIiByPSIxMiIgLz4KICAgICAgICA8Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0i
MTIiIC8+CiAgICA8L2c+CiAgICA8cGF0aAogICAgICAgIGQ9Im0xMzYuODEgMTE2LjUzYy42OSAy
Ni4xNy02NC4xMSA0Mi04MS41Mi0uNzMiCiAgICAgICAgc3R5bGU9ImZpbGw6bm9uZTsgc3Ryb2tl
OiBibGFjazsgc3Ryb2tlLXdpZHRoOiAzOyIKICAgIC8+Cjwvc3ZnPg==
```

#### - SAD SVG Base64 Image :
```bash
data:image/svg+xml;base64,
PHN2ZwogICAgdmlld0JveD0iMCAwIDIwMCAyMDAiCiAgICB3aWR0aD0iNDAwIgogICAgaGVpZ2h0
PSI0MDAiCiAgICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCj4KICAgIDxjaXJj
bGUKICAgICAgICBjeD0iMTAwIgogICAgICAgIGN5PSIxMDAiCiAgICAgICAgZmlsbD0ieWVsbG93
IgogICAgICAgIHI9Ijc4IgogICAgICAgIHN0cm9rZT0iYmxhY2siCiAgICAgICAgc3Ryb2tlLXdp
ZHRoPSIzIgogICAgLz4KICAgIDxnIGNsYXNzPSJleWVzIj4KICAgICAgICA8Y2lyY2xlIGN4PSI2
MSIgY3k9IjgyIiByPSIxMiIgLz4KICAgICAgICA8Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0i
MTIiIC8+CiAgICA8L2c+CiAgICA8cGF0aAogICAgICAgIGQ9Ik01NSAxNDAgUTEwMCAxMTAgMTQ1
IDE0MCIKICAgICAgICBzdHlsZT0iZmlsbDpub25lOyBzdHJva2U6YmxhY2s7IHN0cm9rZS13aWR0
aDozOyIKICAgIC8+Cjwvc3ZnPg==


```
#### Command :
```
base64 -i imgName.svg
```

#### Interact with Blockchain :
```bash
# Mint Nft
cast send 0x_CONTRACT_ADDRESS_32d93F642f64180aa3 "mintNFT()" --private-key your_private_key_bed5efcae784d7bf4f2ff80  --rpc-url http://localhost:8545

# FlipMood Nft
cast send 0x_CONTRACT_ADDRESS_32d93F642f64180aa3 "flipMood(uint256)" 1 --private-key your_private_key_bed5efcae784d7bf4f2ff80 --rpc-url http://localhost:8545


# Getting:
cast call 0x_CONTRACT_ADDRESS_32d93F642f64180aa3 "tokenURI(uint256)" 0
```
---
## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**



Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
