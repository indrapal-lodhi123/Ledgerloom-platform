// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Project {
    string public platformName;
    address public owner;

    constructor(string memory _platformName) {
        platformName = _platformName;
        owner = msg.sender;
    }

    // -------------------------
    // Core Function 1: Store User Data
    // -------------------------
    mapping(address => string) public userData;

    function setUserData(string memory data) public {
        userData[msg.sender] = data;
    }

    function getUserData(address user) public view returns (string memory) {
        return userData[user];
    }

    // -------------------------
    // Core Function 2: Deposit System
    // -------------------------
    mapping(address => uint256) public balances;

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
    }

    // -------------------------
    // Core Function 3: Withdraw Funds
    // -------------------------
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Allow contract to receive ETH
    receive() external payable {}
}

