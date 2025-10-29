# 🗳️ VoteChain - Blockchain Voting DApp

A decentralized, transparent, and tamper-proof voting system built on blockchain using Solidity.  
VoteChain ensures that every vote is counted fairly and prevents double voting through smart contract logic.

---

<img width="903" height="793" alt="Screenshot 2025-10-29 140428" src="https://github.com/user-attachments/assets/670c225c-702e-4f5e-a65f-06be90cbe0ad" />

## 📌 Project Description

VoteChain is a Blockchain-based voting DApp (Decentralized Application) designed to eliminate manipulation, fraud, or unauthorized access in traditional voting systems.  
Using Ethereum smart contracts, every vote becomes publicly verifiable and permanently stored on the blockchain.

This system guarantees:
- ✅ Transparency  
- ✅ Security  
- ✅ One voter = One vote  
- ✅ No third-party tampering  

---

## 🚀 What It Does

- Allows users to **vote for predefined candidates**
- Ensures that **each wallet address can vote only once**
- Stores all votes **directly on blockchain**
- Prevents modification of results by outside parties

Users only need a Web3 wallet such as **MetaMask** to cast a vote.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🗳 Decentralized Voting | Voting happens on Ethereum blockchain, not on a private server |
| 🔒 One Vote Per Account | Smart contract prevents duplicate votes using `mapping(address => bool)` |
| 👁️ Transparent Counting | Anyone can view vote counts from blockchain |
| ⚡ Instant Results | View live voting results without database or backend |
| 🧑‍💻 Simple Deployment | Contract is initialized with default candidates |

---

## 📍 Deployed Smart Contract

> ✅ **Contract Address:** `0x78ea2dE9983957303a069aB44969Cb66bc17c615`  
(You can paste this into any block explorer eg. Etherscan to verify)

---

## 🧠 Smart Contract Used

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;
    address public owner;

    constructor() {
        owner = msg.sender;

        // Default candidates
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
