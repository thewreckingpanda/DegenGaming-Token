// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    string public constant TOKEN_NAME = "DegenGaming Token";
    string public constant TOKEN_SYMBOL = "DMT";

    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply * (10 ** decimals()));
    }

    function mintTokens(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function checkAccountBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function customTransfer(address receiver, uint256 amount) public returns (bool) {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _transfer(_msgSender(), receiver, amount);
        return true;
    }

    function redeemStationaryItems(uint256 itemCode) external returns (bool) {
        require(itemCode >= 1 && itemCode <= 3, "Invalid item code");

        uint256 price;
        string memory itemName;

        if (itemCode == 1) {
            price = 60;
            itemName = "notebook";
        } else if (itemCode == 2) {
            price = 25;
            itemName = "eraser";
        } else {
            price = 10;
            itemName = "pencil";
        }

        require(balanceOf(msg.sender) >= price, "Insufficient balance for item");

        _approve(msg.sender, _msgSender(), price);
        transferFrom(msg.sender, owner(), price);

        emit StationaryRedeemed(msg.sender, itemName, price);
        return true;
    }

    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    event StationaryRedeemed(address indexed account, string itemName, uint256 price);
}
