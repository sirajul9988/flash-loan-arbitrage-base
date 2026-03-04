// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "./FlashLoan.sol";

contract FlashLoanTest is Test {
    FlashLoanReceiver public receiver;
    // Mainnet Aave V3 Pool Addresses Provider
    address constant PROVIDER = 0x2f39d218133AFaB8F2B819B1066c7E434Ad94E9e;
    address constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eb48;

    function setUp() public {
        // Required: forge test --fork-url <ETH_MAINNET_RPC>
        receiver = new FlashLoanReceiver(PROVIDER);
    }

    function testFlashLoan() public {
        // We need to fund the contract with enough USDC to cover the premium (0.05%)
        // because we aren't actually doing an arbitrage in this test.
        deal(USDC, address(receiver), 100 * 10**6); 

        receiver.executeFlashLoan(USDC, 1000 * 10**6);
        
        // If the transaction didn't revert, the loan was successful and repaid.
        assertTrue(true);
    }
}
