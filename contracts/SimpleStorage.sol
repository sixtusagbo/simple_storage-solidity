// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    // Gets implicitly initialized to zero
    uint256 favoriteNumber;
    People public author = People({favoriteNumber: 3, name: "Sixtus"});
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    People[] public persons;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        retrieve();
    }

    // pure, view
    // - doesn't cost gas unless it is called from a function that cost gas
    // view
    // - disallow modification of state
    // - read from state
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // pure
    // - disallow modification of state
    // - disallow read from state
    function add() public pure returns(uint256) {
        return (1 + 2);
    }

    // calldata, memory, storage
    // calldata - temporal data that cannot be modified
    // memory - temporal data that can be modified
    // storage - permanent data and hey, it can be modified
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        persons.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
// 0xd9145CCE52D386f254917e481eB44e9943F39138