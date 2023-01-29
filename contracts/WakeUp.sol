// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.17;
// 2. Imports
import "./Lock.sol";

// 3. Interfaces, Libraries, Contracts

error NameOfTheContract__TheProblem();

/**@title: "A superb Smart Contract"
 * @author: "My Name here"
 * @notice: "Super brief explanation of the contract"
 * @dev: "Super brief technical explanation"
 */

contract NameOfTheContract {
    // Type Declarations
    using Lock for uint256;

    // State variables
    uint256 public constant MAYUSC_CONSTANT = 1;
    address private immutable i_iForImmutable;
    address[] private s_sForStorageVariable;

    // Events

    // Modifiers

    // Functions Order:
    //// constructor
    //// receive
    //// fallback
    //// external
    //// public
    //// internal
    //// private
    //// view / pure
}

/** @param: Explain some param here.
 *  @notice: Write some short ending comentary here. Be nice.
 */
