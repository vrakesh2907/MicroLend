// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address, address, uint256) external returns (bool);
    function transfer(address, uint256) external returns (bool);
}

contract MicroLend {
    IERC20 public collateralToken;

    mapping(address => uint256) public supplied;
    mapping(address => uint256) public borrowed;

    uint256 public constant COLLATERAL_FACTOR = 50; // 50%

    constructor(address _token) {
        collateralToken = IERC20(_token);
    }

    function supply(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        collateralToken.transferFrom(msg.sender, address(this), amount);
        supplied[msg.sender] += amount;
    }

    function borrow(uint256 amount) external {
        uint256 maxBorrow = (supplied[msg.sender] * COLLATERAL_FACTOR) / 100;
        require(borrowed[msg.sender] + amount <= maxBorrow, "Exceeds borrow limit");

        borrowed[msg.sender] += amount;
        payable(msg.sender).transfer(amount);
    }

    function repay() external payable {
        require(borrowed[msg.sender] >= msg.value, "Too much repayment");
        borrowed[msg.sender] -= msg.value;
    }

    function withdraw(uint256 amount) external {
        require(supplied[msg.sender] >= amount, "Not enough supplied");
        require(borrowed[msg.sender] == 0, "Outstanding borrow");

        supplied[msg.sender] -= amount;
        collateralToken.transfer(msg.sender, amount);
    }

    receive() external payable {}
}
