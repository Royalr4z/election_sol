// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Election {

    struct person {
        uint256 RG;
        uint256 CPF;
        uint256 age;
        bool voted;
    }

    address[] addresses;
    mapping(address => person) public people;
    mapping(string => uint256) public parties;
    enum parties_enum { PRONA, ARENA, PL, UNIAO, PT }

    constructor() {
        parties["PRONA"] = 0;
        parties["ARENA"] = 0;
        parties["PL"] = 0;
        parties["UNIAO"] = 0;
        parties["PT"] = 0;
    }

    function uint256ToString(uint256 value) internal pure returns (string memory) {
    
        if (value == 0) {
            return "0";
        }
        
        uint256 temp = value;
        uint256 digits;
        
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        
        return string(buffer);
    }

    function create_person(uint256 rg, uint256 cpf, uint256 age) public {

        string memory numberString = uint256ToString(cpf);
        uint256 cpf_length = bytes(numberString).length;

        require(people[msg.sender].age == 0, "Este usuario ja esta cadastrado.");
        require(cpf_length == 11, "O CPF inserido nao possui 11 caracteres. Por favor, verifique e insira novamente.");
        require(age >= 16, "Idade invalida. Por favor, insira uma idade valida (de 16 anos ou mais).");
        require(age < 150, "Idade invalida.");

        for (uint i = 0; i < addresses.length; i++) {
            require(rg != people[addresses[i]].RG, "RG invalido");
            require(cpf != people[addresses[i]].CPF, "CPF invalido");
        }

        people[msg.sender].RG = rg;
        people[msg.sender].CPF = cpf;
        people[msg.sender].age = age;
        addresses.push(msg.sender);

    }

    //  _______________________
    //  | option | num        |
    //  |---------------------|
    //  | PRONA  | 0          |
    //  | ARENA  | 1          |
    //  | PL     | 2          |
    //  | UNIAO  | 3          |
    //  | PT     | 4          |
    //  |________|____________|
    function Voting(parties_enum option) public {

        require(people[msg.sender].CPF != 0, "Eleitor nao cadastrado");
        require(people[msg.sender].voted == false, "Voce ja votou.");
        string memory party;

        if (option == parties_enum.PRONA) {
            party = "PRONA";
        } else if (option == parties_enum.ARENA) {
            party = "ARENA";
        } else if (option == parties_enum.PL) {
            party = "PL";
        } else if (option == parties_enum.UNIAO) {
            party = "UNIAO";
        } else if (option == parties_enum.PT) {
            party = "PT";
        }

        parties[party] = parties[party] + 1;
        people[msg.sender].voted = true;

    }
}
