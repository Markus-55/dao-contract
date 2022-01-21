// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract MyToken is ERC20, ERC20Permit, ERC20Votes {

  constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken") {}

  // The functions below are overrides required by Solidity.

  function _afterTokenTransfer(address _from, address _to, uint256 _amount)
    internal
    override(ERC20, ERC20Votes) {
      super._afterTokenTransfer(_from, _to, _amount);
    }

  function mint(address _to, uint256 _amount) external {
    _mint(_to, _amount);
  }
  
  function _mint(address _to, uint256 _amount)
    internal
    override(ERC20, ERC20Votes) {
      super._mint(_to, _amount);
    }

  function _burn(address _account, uint256 _amount)
    internal
    override(ERC20, ERC20Votes) {
      super._burn(_account, _amount);
    }

  function delegate(address _delegatee) public override {
    super.delegate(_delegatee);
  }
}