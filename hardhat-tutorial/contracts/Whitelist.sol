pragma solidity ^0.8.0;

contract Whitelist {
    //Max number of whitelisted addresses
    uint8 public maxWhitelistedAddresses;

    //create a mapping of whitelistedAddresses
    //if an address is whitelisted, it is said to be true, it is false by default for other addresses.
    mapping(address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    //setting the max number of whitelisted addresses
    //user will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /** 
     *  addAddressToWhitelist - this function adds the address of the sender to the whitelist   
     */

    function addAddressToWhitelist() public {
        //check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        //check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not throw an error
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");
        //Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        //Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}