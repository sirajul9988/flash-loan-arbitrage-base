# Flash Loan Arbitrage Base

This repository contains a professional implementation of an Aave V3 Flash Loan receiver. It is designed for developers building high-frequency DeFi tools that require temporary large-scale liquidity.

## Features
- **Aave V3 Integration**: Optimized for the latest "Pool" contract architecture.
- **Single/Multiple Asset Support**: Capability to borrow one or multiple tokens simultaneously.
- **Safety Guards**: Inherits from `FlashLoanSimpleReceiverBase` to ensure proper callback handling.
- **Flat Layout**: Simplified file structure for rapid deployment and testing.

## How it Works
1. **Request**: Call `executeFlashLoan` with the asset and amount.
2. **Receive**: Aave transfers the funds and calls `executeOperation`.
3. **Logic**: You perform your arbitrage/trade within the callback.
4. **Repay**: The contract automatically approves Aave to pull the principal plus the premium (0.05%).



## Requirements
- **Solidity**: 0.8.10+
- **Foundry**: For testing via Mainnet Forking.
