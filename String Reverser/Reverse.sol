// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Reverser {
    string public storedString;
    uint256 public storedNumber;

    constructor(string memory _initialString, uint256 _initialNumber) {
        storedString = _initialString;
        storedNumber = _initialNumber;
    }

    function reverseString(string memory _input) public pure returns (string memory) {
        bytes memory str = bytes(_input);
        uint256 length = str.length;

        for (uint256 i = 0; i < length / 2; i++) {
            bytes1 temp = str[i];
            str[i] = str[length - i - 1];
            str[length - i - 1] = temp;
        }

        return string(str);
    }

    // Function to reverse a number
    function reverseNumber(uint256 _input) public pure returns (uint256) {
        uint256 reversed = 0;

        while (_input > 0) {
            uint256 digit = _input % 10;
            reversed = reversed * 10 + digit;
            _input /= 10;
        }

        return reversed;
    }

    function reverseStoredString() public returns (string memory) {
        storedString = reverseString(storedString);
        return storedString;
    }

    // Function to reverse the stored number
    function reverseStoredNumber() public returns (uint256) {
        storedNumber = reverseNumber(storedNumber);
        return storedNumber;
    }
}
