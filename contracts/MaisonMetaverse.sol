pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MaisonMetaverse is ERC721 {
    struct Maison {
        string name;
        uint256 price;
    }

    Maison[] public maisons; // Tableau pour stocker les maisons

    mapping(address => uint256) public totalSupply; // total de maisons par utilisateur
    uint256 public maxSupply; // quantité totale de maisons disponibles
    uint256 public cost; // Le coût d'une maison

    constructor(uint256 _maxSupply, uint256 _cost) ERC721("MaisonMetaverse", "MM") {
        maxSupply = _maxSupply;
        cost = _cost;
    }

    function mint(string memory _name) external payable {
        require(totalSupply[msg.sender] < maxSupply, "Vous avez atteint la dotation maximale");
        // require(msg.value >= cost, 'Le montant payé est inférieur au coût');

        Maison memory newMaison = Maison({
            name: _name,
            price: cost
        });

        maisons.push(newMaison);
        uint256 newMaisonId = maisons.length - 1;
        _mint(msg.sender, newMaisonId);

        totalSupply[msg.sender] += 1;
    }

    function getMaison(uint256 _id) public view returns (string memory name, uint256 price) {
        Maison memory maison = maisons[_id];
        return (maison.name, maison.price);
    }
}

// module.export MaisonMetaverse;
