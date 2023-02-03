// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;
import "@openzeppelin/contracts/access/Ownable.sol";

/* @title: "Wake Up superb Smart Contract"
 * @author: "Jean-Paul Laclau"
 * @notice: "A bet against oneself to wake up early"
 * @dev: "Money deposited can only be collected between an intervall of time"
 */

contract WakeUp is Ownable {
    uint UnixWakeUpHour;
    uint256 deadline;

    function setUnixWakeUpHour(uint x) public onlyOwner {
        UnixWakeUpHour = x;
    }

    function getUnixWakeUpHour() public view onlyOwner returns (uint) {
        return UnixWakeUpHour;
    }

    function deposit() public payable onlyOwner onlyOwner {}

    function getContractBalance() public view onlyOwner returns (uint) {
        return address(this).balance;
    }

    function unixWithdrawAll() public onlyOwner {
        deadline = UnixWakeUpHour + (15 minutes);
        require(block.timestamp >= UnixWakeUpHour);
        require(deadline >= block.timestamp);

        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }
}
