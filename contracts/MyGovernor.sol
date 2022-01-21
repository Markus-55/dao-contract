// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";
import "@openzeppelin/contracts/governance/TimelockController.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorTimelockControl.sol";

contract MyGovernor is Governor, GovernorVotes, GovernorCountingSimple, GovernorVotesQuorumFraction, GovernorTimelockControl {

  constructor(ERC20Votes _token, TimelockController _timelock)
    Governor("MyGovernor")
    GovernorVotes(_token)
    GovernorVotesQuorumFraction(0)
    GovernorTimelockControl(_timelock) {}

    function votingDelay() public pure override returns (uint256) {
      return 1; // 13 sec
    }

    function votingPeriod() public pure override returns (uint256) {
      return 23; // 5 minutes
    }

    function proposalThreshold() public pure override returns (uint256) {
      return 0;
    }

    function quorum(uint256 _blockNumber)
      public
      view
      override(IGovernor, GovernorVotesQuorumFraction)
      returns (uint256) {
        return super.quorum(_blockNumber);
      }

    function getVotes(address _account, uint256 _blockNumber)
      public
      view
      override(IGovernor, GovernorVotes)
      returns (uint256) {
        return super.getVotes(_account, _blockNumber);
      }

    function state(uint256 _proposalId)
      public
      view
      override(Governor, GovernorTimelockControl)
      returns (ProposalState) {
        return super.state(_proposalId);
      }

    function propose(
        address[] memory _targets, 
        uint256[] memory _values,
        bytes[] memory _calldatas, 
        string memory _description
      )
      public
      override(Governor, IGovernor)
      returns (uint256) {
        return super.propose(_targets, _values, _calldatas, _description);
      }
    
    function _execute(
        uint256 _proposalId, 
        address[] memory _targets, 
        uint256[] memory _values,
        bytes[] memory _calldatas,
        bytes32 _descriptionHash
      )
      internal
      override(Governor, GovernorTimelockControl) {
        super._execute(_proposalId, _targets, _values, _calldatas, _descriptionHash);
      }
    
    function _cancel(
        address[] memory _targets, 
        uint256[] memory _values,
        bytes[] memory _calldatas,
        bytes32 _descriptionHash
      )
      internal
      override(Governor, GovernorTimelockControl)
      returns (uint256) {
        return super._cancel(_targets, _values, _calldatas, _descriptionHash);
      }

    function _executor()
      internal
      view
      override(Governor, GovernorTimelockControl)
      returns (address) {
        return super._executor();
      }

    function supportsInterface(bytes4 _interfaceId)
      public
      view
      override(Governor, GovernorTimelockControl)
      returns (bool) {
        return super.supportsInterface(_interfaceId);
      }

    function execute(
      address[] calldata _targets, 
      uint256[] calldata _values, 
      bytes[] calldata _calldatas, 
      bytes32 _descriptionHash
    ) public payable override(Governor, IGovernor) returns (uint256) {
      return super.execute(_targets, _values, _calldatas, _descriptionHash);
    }

    function castVote(uint256 _proposalId, uint8 _support) public override(Governor, IGovernor) returns (uint256) {
      return super.castVote(_proposalId, _support);
    }

    function hasVoted(uint256 _proposalId, address _account) public view override(IGovernor, GovernorCountingSimple) returns (bool) {
      return super.hasVoted(_proposalId, _account);
    }

    function proposalVotes(uint256 _proposalId) public view override 
    returns (
      uint256 againstVotes,
      uint256 forVotes,
      uint256 abstainVotes
    ) {
      return super.proposalVotes(_proposalId);
    }
}