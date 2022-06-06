const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Wallet", () => {
    it("Should accept coins for a small fee, and allow you to get them back", async () => {

        const [owner] = await ethers.getSigners();
        const addr = owner.address;

        const Wallet = await ethers.getContractFactory("Wallet")
        const wallet = await Wallet.deploy({gasPrice: 50000000000});

        await wallet.deployed();

        var dep = await wallet.deposit({value: ethers.utils.parseEther("0.1")});
        dep = await wallet.deposit({value: ethers.utils.parseEther("0.1")});
        dep = await wallet.deposit({value: ethers.utils.parseEther("0.1")});

        expect(dep == 0);

        const db = await wallet.getBalance();
        console.log(db);

        const wd = await wallet.withdraw(ethers.utils.parseEther("0.3"));
        expect (wd == 0);


        const db2 = await wallet.getBalance();
        console.log(db2);
    })}
)