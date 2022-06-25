pragma solidity ^0.4.0;
pragma experimental ABIEncoderV2;

contract Voter{
    uint[] public votes;
    string[] public options;

    constructor(string[] _options) public{
        options = _options;
        votes.length = options.length;
    }

    function vote(uint option) public{
        require(0 <= option && option < options.length, "Invalid option");
        votes[option]++;
    }

    function getOptions() public view returns (string[]){
        return options;
    }

    function getVotes() public view returns (uint[]){
        return votes;
    }
}
