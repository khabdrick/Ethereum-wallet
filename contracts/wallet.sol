// SPDX-License-Identifier: MIT


pragma solidity 0.8.0;

// Get the latest ETH/USD price from chainlink price feed

contract EtherWallet {
    
    //mapping to store addresses and amount of ETH deposited
    mapping(address => uint256) public addressToAmountReceived;
   
    // array of addresses who deposited
    address[] public senders;
    //address of the owner (who deployed the contract)
    address public owner;
    
    // the first person to deploy the contract is
    // the owner
    // constructor() public {
    //     owner = msg.sender;
    // }
    
    function received() public payable {
        //add to mapping and senders array
        addressToAmountReceived[msg.sender] += msg.value;
        senders.push(msg.sender);
    }
    
    
    //modifier: https://medium.com/coinmonks/solidity-tutorial-all-about-modifiers-a86cf81c14cb
    modifier onlyOwner {
    	//is the message sender owner of the contract?
        require(msg.sender == owner);
        
        _;
    }
    
    // onlyOwner modifer will first check the condition inside it 
    // and 
    // if true, withdraw function will be executed 
    function withdraw(uint _amount) public payable onlyOwner {
    
    // If you are using version eight (v0.8) of chainlink aggregator interface,
	// you will need to change the code below to
	// payable(msg.sender).transfer(address(this).balance);
        payable(msg.sender).transfer(_amount);

    }

    function currentBalance() external view returns (uint) {
        return address(this).balance;
    }
}
