# Voting System Using Blockchain

This project implements a Blockchain-based Voting System using Solidity on the Ethereum blockchain. It allows users to vote for candidates in a secure and tamper-proof manner. The system ensures that each voter can only vote once, and the results are stored immutably on the blockchain.

# Features:
Decentralized Voting: Allows users to vote for candidates using Ethereum addresses.

Secure and Transparent: All votes are recorded on the Ethereum blockchain, ensuring transparency and immutability.

Real-Time Vote Count: The system allows you to view live vote counts for each candidate.

Voting Time Limit: Voting can automatically end after a set period or manually by the contract owner.

Leaderboard: Provides a view of all candidates and their vote counts in real-time.

# Technology Stack:
Solidity: For writing the smart contract.

Ethereum Blockchain: For decentralized execution.

Remix IDE: For developing and deploying the contract.

MetaMask: For interacting with the Ethereum network.

# Contract Details:
## Key Components:
Candidate Struct: Stores information about candidates such as their name and vote count.

vote() Function: Allows users to vote for a candidate, ensuring they can only vote once.

endVoting() Function: Allows the owner to manually end the voting process and determine the winner.

getWinner() Function: Determines the candidate with the highest vote count once voting ends.

getLeaderboard() Function: Returns the list of candidates with their respective vote counts.

## Events:
Voted(address voter, uint candidateIndex): Emitted when a user votes.

VotingEnded(string winner): Emitted when voting ends and the winner is determined.

# How to Use:
#### Deploy the Contract:

Open Remix IDE and deploy the contract on the Ethereum network.

Provide the names of the candidates and the voting duration during deployment.

#### Vote:

Users can call the vote() function to cast their vote for a candidate. Each user can vote only once.

#### End Voting:

The contract owner can call the endVoting() function to end the voting and announce the winner.

#### View Candidates:

Use the getCandidates() function to view the list of candidates.

#### Check Results:

Once voting ends, use getWinner() to get the name of the winner.

getLeaderboard() can be used to view the vote count for all candidates.

# Installation:
#### Clone this repository:


`git clone https://github.com/rishee10/Blockchain/tree/main.git`

#### Deploy and interact with the contract in Remix IDE:

Open Remix IDE.

Copy the Solidity code from this repository and paste it into Remix.

Compile and deploy the contract on Ethereum.

Use MetaMask for interacting with the contract.

