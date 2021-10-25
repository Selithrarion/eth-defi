// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "./Token.sol";

contract dBank {
  Token private token;

  mapping(address => uint) public etherBalanceOf;
  mapping(address => uint) public depositStart;
  mapping(address => bool) public isDeposited;

  event Deposit(address indexed user, uint etherAmount, uint timeStart);

  constructor(Token _token) public {
    token = _token;
  }

  function deposit() payable public {
    require(isDeposited[msg.sender] == false, 'deposit already active');
    require(msg.value >= 1e16, 'deposit must be >= 0.01 ETH');

    etherBalanceOf[msg.sender] += msg.value;
    depositStart[msg.sender] += block.timestamp;
    isDeposited[msg.sender] = true;

    emit Deposit(msg.sender, msg.value, block.timestamp);
  }

  function withdraw() public {
    //check if msg.sender deposit status is true
    //assign msg.sender ether deposit balance to variable for event

    //check user's hodl time

    //calc interest per second
    //calc accrued interest

    //send eth to user
    //send interest in tokens to user

    //reset depositer data

    //emit event
  }

  function borrow() payable public {
    //check if collateral is >= than 0.01 ETH
    //check if user doesn't have active loan

    //add msg.value to ether collateral

    //calc tokens amount to mint, 50% of msg.value

    //mint&send tokens to user

    //activate borrower's loan status

    //emit event
  }

  function payOff() public {
    //check if loan is active
    //transfer tokens from user back to the contract

    //calc fee

    //send user's collateral minus fee

    //reset borrower's data

    //emit event
  }
}