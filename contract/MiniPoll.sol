// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    // Structure to store candidate info
    struct Candidate {
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;
    address public owner;

    constructor() {
        owner = msg.sender;

        // ✅ Add candidates here (edit names as you want)
        candidates.push(Candidate("Alice", 0));
        candidates.push(Candidate("Bob", 0));
        candidates.push(Candidate("Charlie", 0));
    }

    function vote(uint candidateIndex) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(candidateIndex < candidates.length, "Invalid candidate index");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;
    }

    function getTotalCandidates() public view returns (uint) {
        return candidates.length;
    }

    function getCandidate(uint candidateIndex)
        public
        view
        returns (string memory name, uint voteCount)
    {
        require(candidateIndex < candidates.length, "Invalid candidate index");
        Candidate storage candidate = candidates[candidateIndex];
        return (candidate.name, candidate.voteCount);
    }
}
