// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    
    // Struct for Candidate
    struct Candidate {
        string name;
        uint voteCount;
    }

    address public owner;   // Address of the contract owner
    mapping(address => bool) public hasVoted;   // To track who has voted
    Candidate[] public candidates;   // Dynamic array of candidates
    bool public votingEnded;   // To check if voting is ended
    uint public votingEndTime;  // Time when voting will automatically end (optional)

    // Events
    event Voted(address voter, uint candidateIndex);
    event VotingEnded(string winner);

    // Constructor to add candidate names
    constructor(string[] memory candidateNames, uint _durationInMinutes) {
        owner = msg.sender;
        votingEndTime = block.timestamp + (_durationInMinutes * 1 minutes);

        for (uint i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate(candidateNames[i], 0));
        }
    }

    // Function to vote for a candidate
    function vote(uint candidateIndex) public {
        require(!votingEnded, "Voting has ended.");
        require(block.timestamp <= votingEndTime, "Voting time is over.");
        require(!hasVoted[msg.sender], "You have already voted.");
        require(candidateIndex < candidates.length, "Invalid candidate index.");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;

        emit Voted(msg.sender, candidateIndex);
    }

    // Function to manually end voting (only owner)
    function endVoting() public {
        require(msg.sender == owner, "Only owner can end voting.");
        require(!votingEnded, "Voting already ended.");

        votingEnded = true;

        string memory winnerName = getWinner();
        emit VotingEnded(winnerName);
    }

    // View function to see all candidates
    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }

    // View function to get winner name
    function getWinner() public view returns (string memory winnerName) {
        require(votingEnded || block.timestamp > votingEndTime, "Voting is still ongoing.");

        uint maxVotes = 0;
        uint winnerIndex = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }

        winnerName = candidates[winnerIndex].name;
    }

    // New function: Get full leaderboard
    function getLeaderboard() public view returns (string[] memory names, uint[] memory votes) {
        uint candidateCount = candidates.length;
        names = new string[](candidateCount);
        votes = new uint[](candidateCount);

        for (uint i = 0; i < candidateCount; i++) {
            names[i] = candidates[i].name;
            votes[i] = candidates[i].voteCount;
        }

        return (names, votes);
    }

    // Get total number of candidates
    function getTotalCandidates() public view returns (uint) {
        return candidates.length;
    }
}
