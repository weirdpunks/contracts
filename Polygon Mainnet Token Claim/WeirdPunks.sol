// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Enumerable.sol";

contract WeirdPunks is ERC721Enumerable {
 
  uint256 public maxSupply = 1000;
  mapping(uint256 => uint256) internal migrateTimestamp;

  constructor(
  ) ERC721("Weird Punks", "WP") {}

  function walletOfOwner(address _owner) public view returns (uint256[] memory) {
    uint256 ownerTokenCount = balanceOf(_owner);
    uint256[] memory tokenIds = new uint256[](ownerTokenCount);
    for (uint256 i; i < ownerTokenCount; i++) {
      tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
    }
    return tokenIds;
  }

  function getMigrateTimestamp(uint256 _id) public view returns(uint256) {
    return migrateTimestamp[_id];
  }
}