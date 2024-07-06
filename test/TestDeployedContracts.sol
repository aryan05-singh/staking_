// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/RewardToken.sol";
import "../src/StakingToken.sol";
import "../src/StakingContract.sol";

contract TestDeployedContracts is Script {
    function run() external {
        // Deploy RewardToken
        RewardToken rewardToken = new RewardToken(1000000 * 10 ** 18);
        
        // Deploy StakingToken
        StakingToken stakingToken = new StakingToken(1000000 * 10 ** 18);

        // Deploy StakingContract
        StakingContract stakingContract = new StakingContract(address(stakingToken), address(rewardToken), 1);

        // Perform test operations
        testTokenTransfer(rewardToken);
        testStaking(stakingToken, stakingContract);
        testRewardDistribution(stakingContract, rewardToken);
    }

    function testTokenTransfer(RewardToken rewardToken) internal {
        // Test token transfers
        address recipient = address(0xc04757f4663c349E1b8017f782a41E2242077Cc4); // Replace with actual recipient address
        rewardToken.transfer(recipient, 1000 * 10 ** 18); // Transfer 1000 tokens
        // Assert balance of recipient
        // Example: assert(rewardToken.balanceOf(recipient) == 1000 * 10 ** 18);
    }

    function testStaking(StakingToken stakingToken, StakingContract stakingContract) internal {
        // Test staking operations
        uint256 amountToStake = 100 * 10 ** 18;
        stakingToken.approve(address(stakingContract), amountToStake);
        stakingContract.stake(amountToStake);
        // Assert staking balances or states
    }

    function testRewardDistribution(StakingContract stakingContract, RewardToken rewardToken) internal {
        // Test reward distribution
        stakingContract.getReward();
        // Assert rewards received by staker
    }
}
