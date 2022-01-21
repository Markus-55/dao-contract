// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/governance/TimelockController.sol";

contract MyTimelockController is TimelockController {
  constructor(uint256 _minDelay, address[] memory _proposers, address[] memory _executors)
  TimelockController(_minDelay, _proposers, _executors) {}

  function isOperation(bytes32 _id) public view override(TimelockController) returns (bool) {
    return super.isOperation(_id);
  }

  function isOperationPending(bytes32 _id) public view override(TimelockController) returns (bool) {
    return super.isOperationPending(_id);
  }

  function isOperationReady(bytes32 _id) public view override(TimelockController) returns (bool) {
    return super.isOperationReady(_id);
  }

  function isOperationDone(bytes32 _id) public view override(TimelockController) returns (bool) {
    return super.isOperationDone(_id);
  }

  function getTimestamp(bytes32 _id) public view override(TimelockController) returns (uint256) {
    return super.getTimestamp(_id);
  }

  function getMinDelay() public view override(TimelockController) returns (uint256) {
    return super.getMinDelay();
  }

  function hashOperation(
    address _target, 
    uint256 _value, 
    bytes calldata _data, 
    bytes32 _predecessor, 
    bytes32 _salt) public pure override(TimelockController) returns (bytes32) {
      return super.hashOperation(_target, _value, _data, _predecessor, _salt);
    }

  function hashOperationBatch(
    address[] calldata _targets, 
    uint256[] calldata _values, 
    bytes[] calldata _datas, 
    bytes32 _predecessor, 
    bytes32 _salt) public pure override(TimelockController) returns (bytes32) {
      return super.hashOperationBatch(_targets, _values, _datas, _predecessor, _salt);
    }

  function schedule(
    address _target, 
    uint256 _value, 
    bytes calldata _data, 
    bytes32 _predecessor, 
    bytes32 _salt, 
    uint256 _delay) public override(TimelockController) {
      super.schedule(_target, _value, _data, _predecessor, _salt, _delay);
    }

  function scheduleBatch(
    address[] calldata _targets, 
    uint256[] calldata _values, 
    bytes[] calldata _datas, 
    bytes32 _predecessor, 
    bytes32 _salt, 
    uint256 _delay) public override(TimelockController) {
      super.scheduleBatch(_targets, _values, _datas, _predecessor, _salt, _delay);
    }

  function cancel(bytes32 _id) public override(TimelockController) {
    super.cancel(_id);
  }

  function execute(
    address _target, 
    uint256 _value, 
    bytes calldata _data, 
    bytes32 _predecessor, 
    bytes32 _salt) public payable override(TimelockController) {
      super.execute(_target, _value, _data, _predecessor, _salt);
    }

  function executeBatch(
    address[] calldata _targets, 
    uint256[] calldata _values, 
    bytes[] calldata _datas, 
    bytes32 _predecessor, 
    bytes32 _salt) public payable override(TimelockController) {
      super.executeBatch(_targets, _values, _datas, _predecessor, _salt);
    }

  function updateDelay(uint256 _newDelay) external override(TimelockController) {}
}