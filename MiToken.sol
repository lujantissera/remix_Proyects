
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

//import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";



contract MiToken is ERC20("Mi Token", "MT") {


   constructor() {
       _mint(msg.sender, 100000000);
   }


}
