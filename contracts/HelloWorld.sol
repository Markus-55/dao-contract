//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4<=0.9.0;

contract HelloWorld {
  
  string hello = "Hello World!";

  function helloWorld() external view returns(string memory greeting) {
    return hello;
  }

  
}