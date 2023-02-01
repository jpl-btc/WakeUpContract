// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity 0.8.17;
// 2. Imports

import "@openzeppelin/contracts/access/Ownable.sol";

// 3. Interfaces, Libraries, Contracts

/* @title: "Wake Up superb Smart Contract"
 * @author: "Jean-Paul Laclau"
 * @notice: "A bet against oneself to wake up early"
 * @dev: "Money deposited can only be collected between an intervall of time"
 */

contract WakeUp is Ownable {
    // Type Declarations
    // State variables
    uint WakeUpHour;
    uint CurrentHour;
    uint UnixWakeUpHour;

    // Events
    event WakeUpHourSet(uint WakeUpHour);

    // Modifiers
    // Functions Order:

    function setWakeUpHour(uint x) public onlyOwner {
        WakeUpHour = x;
    }

    function currentHour(uint x) public onlyOwner {
        CurrentHour = x;
    }

    function setUnixWakeUpHour(uint x) public onlyOwner {
        UnixWakeUpHour = x;
    }

    function getWakeUpHour() public view onlyOwner returns (uint) {
        return WakeUpHour;
    }

    function getCurrentHour() public view onlyOwner returns (uint) {
        return CurrentHour;
    }

    function getUnixWakeUpHour() public view onlyOwner returns (uint) {
        return UnixWakeUpHour;
    }

    function deposit() public payable onlyOwner onlyOwner {}

    function getContractBalance() public view onlyOwner returns (uint) {
        return address(this).balance;
    }

    function withdrawAll() public onlyOwner {
        require(WakeUpHour == CurrentHour);
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    function unixWithdrawAll() public onlyOwner {
        require(UnixWakeUpHour == CurrentHour);
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }
    //// constructor
    //// receive
    //// fallback
    //// external
    //// public
    //// internal
    //// private
    //// view / pure
}

/*  @param: Explain some param here.
 *  @notice: Write some short ending comentary here. Be nice.
 */
