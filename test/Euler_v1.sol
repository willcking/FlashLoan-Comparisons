// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./interface.sol";
import "forge-std/Test.sol";

contract Euler_v1 is Test {

    IERC20 public usdc = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48); // We want to borrow USDC
    IEulerFlashloan public euler_flashloan = IEulerFlashloan(0x07df2ad9878F8797B4055230bbAE5C808b8259b3); // Flashloan

    function setUp() public {
        vm.createSelectFork("mainnet", 16818703); 
        vm.label(address(euler_flashloan), "euler_flashloan");

        // We should prepare for some USDC to pay the fee
        deal(address(usdc), address(this), 1_00000 * 1e18);
        
    }

    function test_flashloan() public {
        euler_flashloan.flashLoan(address(this), address(usdc), 100 * 1e6, "Go to the CallBack"); 
    }

    function onFlashLoan(
        address receiver,
        address token,
        uint256 amount,
        uint256,
        bytes calldata
    ) external returns (bytes32) {
        assertEq(receiver, address(this));
        assertEq(token, address(usdc));
        assertEq(amount, 100 * 1e6);

        // There is no fee in Euler flashloan: receiver.onFlashLoan(msgSender, token, amount, 0, data) == CALLBACK_SUCCESS,
        usdc.approve(msg.sender, amount);
        return keccak256("ERC3156FlashBorrower.onFlashLoan");
    }
}