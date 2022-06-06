pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Wallet {
    uint256 balance;
    address owner;

    constructor() {
        owner = msg.sender;
        balance = 0;
        console.log("deploying a contract");

    }

    function deposit() payable public returns (uint) {
        uint8 err = 0;
        if (msg.sender != owner) {
            err = 2;
        }
        else {
            console.log("you have deposited:", msg.value);
            balance += msg.value;
        }

        return err;
    }


    function getBalance() external view returns (uint256) {
        console.log(owner);
        return balance;
    }

    function withdraw(uint amount) payable public returns (uint) {
        uint8 err = 0;

        console.log("the balance is", balance);
        if (msg.sender != owner) {
            err = 2;
        }
        else {
            balance -= amount;
            payable(msg.sender).transfer(amount);
        }

        return err;
    }

   

}
