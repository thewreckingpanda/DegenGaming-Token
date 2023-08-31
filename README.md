# DegenToken Smart Contract

This repository contains the Solidity source code for the `DegenToken` smart contract, an ERC20 token with extended features and functionalities. The contract leverages the OpenZeppelin library to provide standard ERC20 functionality, token burning, and ownership management. The token is designed to be used in a decentralized gaming ecosystem.

## Overview

The `DegenToken` contract implements the following features:

1. **Token Information:**
   - Name: DegenGaming Token
   - Symbol: DMT

2. **Initial Supply:**
   - The contract's constructor allows the deployment address to mint an initial supply of tokens.

3. **Minting:**
   - The contract owner can mint additional tokens to specified addresses.

4. **Account Balance:**
   - Users can check their own token balance using the `checkAccountBalance` function.

5. **Custom Transfer:**
   - Users can initiate custom transfers of tokens using the `customTransfer` function, with additional checks for balance sufficiency.

6. **Redemption of Stationary Items:**
   - Users can redeem stationary items by providing an item code (1, 2, or 3) and having a sufficient balance of tokens. The item's price varies based on the item code.
   - Redeemed tokens are transferred to the contract owner's address.

7. **Token Burning:**
   - Users can burn their tokens using the `burnTokens` function.

## Usage

To deploy and interact with the `DegenToken` smart contract, follow these steps:

1. Deploy the contract, providing a name, symbol, and initial supply of tokens.
2. As the contract owner, mint tokens to specific addresses using the `mintTokens` function.
3. Users can check their token balance with the `checkAccountBalance` function.
4. Users can initiate custom transfers using the `customTransfer` function.
5. Users can redeem stationary items using the `redeemStationaryItems` function, providing the correct item code and sufficient balance.
6. Users can burn their tokens using the `burnTokens` function.

## License

This smart contract is licensed under the MIT License. You can find the license text in the SPDX-License-Identifier field in the source code files.

## Disclaimer

Please note that this README provides a high-level overview of the `DegenToken` smart contract. Always review the source code thoroughly before deploying or interacting with any smart contract. Additionally, consider security audits and best practices for smart contract development.
