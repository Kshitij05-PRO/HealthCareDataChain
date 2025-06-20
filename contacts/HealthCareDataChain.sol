// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract HealthCareDataChain {
    address public admin;

    struct Record {
        string patientId;
        string dataHash;
        address addedBy;
        uint256 timestamp;
    }

    mapping(string => Record[]) private patientRecords;

    event RecordAdded(string patientId, string dataHash, address indexed addedBy);

    constructor() {
        admin = msg.sender;
    }

    function addRecord(string memory _patientId, string memory _dataHash) public {
        Record memory newRecord = Record({
            patientId: _patientId,
            dataHash: _dataHash,
            addedBy: msg.sender,
            timestamp: block.timestamp
        });
        patientRecords[_patientId].push(newRecord);
        emit RecordAdded(_patientId, _dataHash, msg.sender);
    }

    function getRecords(string memory _patientId) public view returns (Record[] memory) {
        return patientRecords[_patientId];
    }

    function getRecordCount(string memory _patientId) public view returns (uint256) {
        return patientRecords[_patientId].length;
    }
}
