pragma solidity ^0.4.2;

contract Election{
	// read/write candiate
	// declaring candidate public will make a getter function with same name
	string public candidate; // state variable for whole contract
	
	// Contstructor
	function Election () public{
		candidate = "Cadidate 1";
	}
}