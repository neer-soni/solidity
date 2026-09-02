// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage {
    // Basic type : boolean, uint , int, address, bytes
    //bool hasFavouriteNumber = true;
    //uint256 favouriteNumber; // 0
    //int256 number = -90;
    //string favouritetext = "88 i love this number;";
    //bytes32 favouriteBytes32 = "cat";
    uint256 public myfavouriteNumber; // when no value is provided it will be 0
    //uint256[] listofFavouriteNumber;

    struct person {
        uint _favouriteNumber;
        string name;
    }

    function store(uint256 _favouriteNumber) public {
        myfavouriteNumber = _favouriteNumber;
        myfavouriteNumber = myfavouriteNumber + 1;
    }

    //person public myfriend = person(7, "patrick");
    // person public youtfriend = person(9, "neer");

    person[] public listofpeople;

    mapping(string => uint256) public nameToFavouriteNumber;

    function retreive() public view returns (uint256) {
        // view, pure  with this keyword not allow modify anything
        return myfavouriteNumber;
    }

    //calldata, memory, storage
    function addPerson(string memory name, uint256 _favouriteNumber) public {
        // person memory newPerson = person(_favouriteNumber,name);
        listofpeople.push(person(_favouriteNumber, name));
        nameToFavouriteNumber[name] = _favouriteNumber;
    }
}
contract StorageFactory {
    //uint256 public favouriteNumber
    //type
    SimpleStorage public simplestorage;

    function createSimpleStorageContract() public {
        simplestorage = new SimpleStorage();
    }
}
