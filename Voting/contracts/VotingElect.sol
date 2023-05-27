// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Interfaces/IVotingElect.sol";
import "./VotingStorage.sol";

contract VotingElect is VotingStorage, IVotingElect {
    address public chairperson;

    constructor() {
        chairperson = msg.sender;
    }

    event VoterRegistered(uint id);
    event CandidatesRegistered(uint count);
    event VoteCasted(uint voterId, uint candidateId);
    uint _votingStartTime;
    uint _votingEndTime;

    function registerVoter(uint voterId) public {
        require(!containsVoter(), "Voter already registered");
        _registerVoter(voterId);
        emit VoterRegistered(voterId);
    }

    function initializeCandidates(
        uint[] memory id,
        string[] memory name,
        uint[] memory voteCount,
        string[] memory image,
        string[] memory party,
        string[] memory position,
        uint votingStartTime,
        uint votingEndTime
    ) public returns (uint) {
        for (uint i = 0; i < name.length; i++) {
            require(!containsCandidate(id[i]), "Candidates ID already exists.");
        }
        _votingStartTime = votingStartTime;
        _votingEndTime = votingEndTime;
        uint count = _initializeCandidates(
            id,
            name,
            voteCount,
            image,
            party,
            position
        );
        emit CandidatesRegistered(count);
        return count;
    }

    function containsCandidate(uint id) public view returns (bool) {
        return candidates[id].id != 0;
    }

    function containsVoter() public view returns (bool) {
        return voters[msg.sender].id != 0;
    }

    function winnigCandidate() external override {}

    function votingDuration() external override {}

    function castVote(uint _candidateId, uint _voterId) public {
        require(containsVoter(), "Voter Not Registered");

        emit VoteCasted(_voterId, _candidateId);
    }
}
