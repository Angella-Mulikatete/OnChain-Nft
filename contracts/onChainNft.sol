// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OnChainNFT is ERC721URIStorage, Ownable {
    
  
    uint8 _tokenIds;

    constructor() ERC721 ("OnChainNFT", "OCN") Ownable(msg.sender){}

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(svg));
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }

    // function formatTokenURI(string memory imageURI) public pure returns (string memory){
    //     return 
    //         string(
    //             abi.encodePacked(
    //                 "data:application/json;base64,",
    //                 Base64.encode(
    //                     bytes(
    //                         abi.encodePacked(
    //                             '{"name": "LCM ON-CHAINED", "description": "A simple SVG based on-chain NFT", "image":"',
    //                             imageURI,
    //                             '"}'
    //                         )
    //                     )
    //                 )
    //             )
    //         );
    // }

    function formatTokenURI(string memory imageURI)
    public
    pure
    returns (string memory)
{
    string memory baseURL = "data:application/json;base64,";
    string memory json = string(
        abi.encodePacked(
            '{"name": "LCM ON-CHAINED", "description": "A simple SVG based on-chain NFT", "image":"',
            imageURI,
            '"}'
        )
    );
    string memory jsonBase64Encoded = Base64.encode(bytes(json));
    return string(abi.encodePacked(baseURL, jsonBase64Encoded));
}
    
    function mint(string memory svg) public onlyOwner{
        string memory imageURI = svgToImageURI(svg);
        string memory tokenURI = formatTokenURI(imageURI);

        _tokenIds++;
        uint256 newItemId = _tokenIds;

        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
    }

}