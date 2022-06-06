pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Wallet {
    address public owner; 
    address payable private wal;
    mapping (address => wallet) public balances;

    struct wallet {
        uint256 balance;
    }


    constructor() {
        owner = msg.sender;
    }

    function deposit() payable public returns (uint) {
        uint8 err = 0;
        if (msg.sender != owner) {
            err = 1;
        }
        else {
            balances[msg.sender].balance += msg.value;
        }

        return err;
    }

    function deposit(uint amount, address payable sendTo) payable public returns (uint) {
        uint8 err = 0;
        if (msg.sender != owner) {
            err = 1;
        }
        else {
            balances[msg.sender].balance -= amount;
            sendTo.transfer(amount);
        }

        return err;
    }

}
