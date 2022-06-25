pragma solidity ^0.4.0;
pragma experimental ABIEncoderV2;

contract Voter{
    uint[] public votes;
    string[] public options;
    mapping (address => bool) hasVoted;

    constructor(string[] _options) public{
        options = _options;
        votes.length = options.length;
    }

    function vote(uint option) public{
        require(0 <= option && option < options.length, "Invalid option");
        require((!hasVoted[msg.sender]), "You have already voted");
        
        votes[option]++;
        hasVoted[msg.sender] = true;
    }

    function getOptions() public view returns (string[]){
        return options;
    }

    function getVotes() public view returns (uint[]){
        return votes;
    }
}
