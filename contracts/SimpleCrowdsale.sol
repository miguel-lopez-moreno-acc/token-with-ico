// contracts/SimpleCrowdsale.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.5.5;

import "@openzeppelin/contracts/crowdsale/Crowdsale.sol";
import "@openzeppelin/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "@openzeppelin/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "@openzeppelin/contracts/crowdsale/distribution/PostDeliveryCrowdsale.sol";

/**
 * @title SimpleCrowdsale
 * @dev This is an example of a fully fledged crowdsale.
 */
contract SimpleCrowdsale is Crowdsale, CappedCrowdsale, TimedCrowdsale, PostDeliveryCrowdsale {
    constructor(
        uint256 rate,               // rate, in TKNbits
        address payable wallet,     // wallet to send Ether
        IERC20 token,               // the token
        uint256 cap,                // total cap, in wei
        uint256 openingTime,        // opening time in unix epoch seconds
        uint256 closingTime         // closing time in unix epoch seconds
    ) PostDeliveryCrowdsale() 
      CappedCrowdsale(cap)
      TimedCrowdsale(openingTime, closingTime)
      Crowdsale(rate, wallet, token)
      public 
    {}
}