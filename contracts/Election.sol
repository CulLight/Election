pragma solidity ^0.4.2;

contract Election{
	// Model a Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}
	// Store Candidates
	
	// Store accounts that have voted
	mapping (address => bool) public voters;
	// Fetch Candidate
	// there is no way to get length of mapping and to iterate over it.
	// because for every non valid key, we still get an empty value (candidate)
	// need to keep track with candidates Count
	mapping (uint => Candidate) public candidates;
	
	// Store Candidates Count, set to 0 by default
	uint public candidatesCount; 
	
	function Election () public {
		// code is run when smart contract is deployed to blockchain
		addCandidate("Markus Hasler");
		addCandidate("Ronny Rueffel");		
	}
	
	// local variable gets underscore
	function addCandidate (string _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}
	
	function vote (uint _candidateId) public {
		// require will send back unused gas
		// check that voter has not voted already and candidateId is valid
		require(!voters[msg.sender]);
		require(_candidateId > 0 && _candidateId <= candidatesCount);
		
		// record that voter has voted
		voters[msg.sender] = true;
		// update candidate vote count
		candidates[_candidateId].voteCount ++;
	}
}