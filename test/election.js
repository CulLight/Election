var Election = artifacts.require("./Election.sol");

contract("Election", function(accounts) {

	var electionInstance;
	
	// test that for correct number of candidates
	// it we get from moka (from truffle)
	// assert we get from chai (from truffle)
	it("initializes with two candidates", function() {
		return Election.deployed().then(function(instance) {
			return instance.candidatesCount();
			}).then(function(count) {
				assert.equal(count, 2);
		});
	});
	
	// test for correct initialization
	it("inititalizes the candidates with the correct values", function (){
		return Election.deployed().then(function(instance){
			electionInstance = instance;
			return electionInstance.candidates(1);
		}).then(function(candidate) {
			assert.equal(candidate[0], 1, "contains the correct id");
			assert.equal(candidate[1], "Markus Hasler", "contains the correct name");
			assert.equal(candidate[2], 0, "contains the correct vote count");
			return electionInstance.candidates(2);
		}).then(function(candidate) {
			assert.equal(candidate[0], 2, "contains the correct id");
			assert.equal(candidate[1], "Ronny Rueffel", "contains the correct name");
			assert.equal(candidate[2], 0, "contains the correct vote count");
		});
	});
});