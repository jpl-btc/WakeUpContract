// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity 0.8.17;

// 2. Imports
// 3. Interfaces, Libraries, Contracts

/* @title: "Wake Up superb Smart Contract"
 * @author: "Jean-Paul Laclau"
 * @notice: "A bet against oneself to wake up early"
 * @dev: "Money deposited can only be collected between an intervall of time"
 */

contract WakeUp {
    // Type Declarations
    // State variables
    uint Hour;

    // Events
    event HourSet(uint Hour);

    // Modifiers
    // Functions Order:

    function setHour(uint x) public {
        Hour = x;
    }

    function getHour() public view returns (uint) {
        return Hour;
    }

    function deposit() public payable {}

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawAll() public {
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
