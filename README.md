# Crypto Payment Gateway Smart Contract

## Overview

This project implements a basic payment gateway smart contract using the Clarity language for the Stacks blockchain. The contract facilitates crypto transfers between users, allowing for deposits, withdrawals, and transfers of STX tokens.

## Features

- Deposit STX tokens into the contract
- Withdraw STX tokens from the contract
- Transfer STX tokens between users within the contract
- Check user balances
- Change contract ownership

## Contract Functions

### Public Functions

1. `deposit(amount: uint) -> (response bool uint)`
   - Allows users to deposit STX into the contract.
   - Returns `(ok true)` on success, `(err u0)` if amount is 0.

2. `withdraw(amount: uint) -> (response bool uint)`
   - Enables users to withdraw their deposited STX.
   - Returns `(ok true)` on success, `(err u1)` if insufficient balance.

3. `transfer(recipient: principal, amount: uint) -> (response bool uint)`
   - Transfers STX between users within the contract.
   - Returns `(ok true)` on success, `(err u2)` if insufficient balance.

4. `change-owner(new-owner: principal) -> (response bool uint)`
   - Allows the contract owner to transfer ownership.
   - Returns `(ok true)` on success, `(err u3)` if not called by current owner.

### Read-Only Functions

1. `get-balance(user: principal) -> uint`
   - Returns the balance of a specified user.

## Usage

To use this contract:

1. Deploy the contract to the Stacks blockchain.
2. Users can interact with the contract through supported Stacks wallets or by sending transactions directly to the contract address.
3. Use the provided functions to deposit, withdraw, and transfer STX tokens.

## Security Considerations

- This is a basic implementation and may need additional security measures for production use.
- Ensure proper testing and auditing before deploying to mainnet.
- Consider implementing additional features like pausing functionality and more granular access controls.

## Development

To further develop or modify this contract:

1. Set up a Stacks development environment.
2. Use Clarity tools for testing and deployment.
3. Thoroughly test any changes using the Stacks testnet before deploying to mainnet.

## Disclaimer

This smart contract is provided as-is. Users interact with it at their own risk. Always verify the contract's functionality and security before use.