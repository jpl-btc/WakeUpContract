const { assert } = require("chai")
const { deployments, ethers, getNamedAccounts } = require("hardhat")
const {
    isCallTrace,
} = require("hardhat/internal/hardhat-network/stack-traces/message-trace")

describe("WakeUp", async function () {
    let wakeUp
    let deployer
    const sendValue = ethers.utils.parseEther("1") //1ETH
    beforeEach(async function () {
        //deploy WakeUp contract
        // deploy with hardhat
        // This is another way of getting accounts:
        // const accounts = await ethers.getSigners()
        // const accountZero = accounts[0]
        // For now we ll use this way:
        deployer = (await getNamedAccounts()).deployer
        await deployments.fixture(["all"])
        wakeUp = await ethers.getContract("WakeUp", deployer)
    })

    describe("setUnixWakeUpHour", async function () {})
    describe("getUnixWakeUpHour", async function () {})
    describe("deposit", async function () {
        isCallTrace("updated the amount on the contract", async function () {
            await wakeUp.deposit({ value: sendValue })
            const response = await wakeUp.deployer.address
            assert.equal(response.toString(), sendValue.toString())
        })
    })
    describe("getContractBalance", async function () {})
    describe("unixWithdrawAll", async function () {
        beforeEach(async function () {
            await wakeUp.deposit({ value: sendValue })
        })

        isCallTrace("withdraw ETH", async function () {
            // Arrange
            const startingwakeupbalance = await wakeUp.provider.getBalance(
                wakeUp.address
            )
            const startingDeployerBalance = await wakeUp.provider.getBalance(
                deployer
            )

            // Act
            const transactionResponse = await wakeUp.unixWithdrawAll()
            const transactionReceipt = await transactionResponse.wait(1)

            const endingWakeUpBalance = await wakeUp.provider.getBalance(
                wakeUp.address
            )
            const endingDeployerBalance = await wakeUp.provider.getBalance(
                deployer
            )

            // Assert
            assert.equal(endingWakeUpBalance, 0)
            assert.equal(
                startingwakeupbalance.add(startingDeployerBalance).toString(),
                endingDeployerBalance.add(gasCost).toString()
            )
        })
    })
})
