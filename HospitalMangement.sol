// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract HospitalManagement{
    
    address public receptionist;
    uint256 public rooms;
    mapping(uint256 => string) public patientInfo;

    constructor(uint256 _rooms, address _receptionist){
        rooms = _rooms;
        receptionist = _receptionist;
    }

    modifier onlyReceptionist(){
        require(msg.sender == receptionist, "Only receptionist can add patient.");
        _;
    }
    function addPatient(uint256 patientID, string memory _name) public onlyReceptionist {
        require(rooms > 0, "No rooms available!");
        patientInfo[patientID] = _name;
        rooms = rooms -1;
    }
}