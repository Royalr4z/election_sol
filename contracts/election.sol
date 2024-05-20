// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Election {

    struct person {
        string RG;
        string CPF;
        uint256 age;
        bool voted;
    }

    address[] addresses;
    mapping(address => person) public people;
    mapping(string => uint256) public parties;
    enum parties_enum { PRONA, ARENA, PL, UNIAO, PT }

    struct view_election {
        uint PRONA;
        uint ARENA;
        uint PL;
        uint UNIAO;
        uint PT;
    }

    view_election public Viewing_Voting;

    constructor() {
        parties["PRONA"] = 0;
        parties["ARENA"] = 0;
        parties["PL"] = 0;
        parties["UNIAO"] = 0;
        parties["PT"] = 0;

        Viewing_Voting.PRONA = parties["PRONA"];
        Viewing_Voting.ARENA = parties["ARENA"];
        Viewing_Voting.PL = parties["PL"];
        Viewing_Voting.UNIAO = parties["UNIAO"];
        Viewing_Voting.PT = parties["PT"];
    }


    /*
    * Esta função retorna o CPF informado pelo usuário no formato (xxx.xxx.xxx-xx).
    * 
    * @param {string} value - CPF informado pelo usuário.
    * @returns {string} - Retorna o CPF no Formato Correto.
    */
    function changingStringToCPF(string memory value) internal pure returns (string memory) {
    
        bytes memory str = new bytes(14);
        uint256 count = 0;
        for (uint i = 0; i < bytes(value).length; i++) {
            bytes1 character = bytes(value)[i];
            if (uint8(character) >= 48 && uint8(character) <= 57) {
                if (count == 3 || count == 7) {
                    str[count] = '.';
                    str[count+1] = character;
                    count++;
                } else if (count == 11) {
                    str[count] = '-';
                    str[count+1] = character;
                    count++;
                } else if (count != 11 || count != 3 || count != 7)  {
                    str[count] = character;
                }

                count++;
            }
        }

        return string(str);
    }


    /*
    * Esta função retorna o RG informado pelo usuário sem letras ou caracteres especiais.
    * 
    * @param {string} value - RG informado pelo usuário.
    * @returns {string} - Retorna o RG no Formato Correto.
    */
    function changingStringToRG(string memory value) internal pure returns (string memory) {
    
        bytes memory str = new bytes(10);
        uint256 count = 0;
        for (uint i = 0; i < bytes(value).length; i++) {
            bytes1 character = bytes(value)[i];
            if (uint8(character) >= 48 && uint8(character) <= 57) {
                str[count] = character;
                count++;
            }
        }

        return string(str);
    }


    /*
    * Esta função retorna o tamanho da string sem letras ou caracteres especiais.
    * 
    * @param {string} value - string que o usuário deseja saber o tamanho.
    * @returns {uint256} - Retorna o tamanho.
    */
    function lengthString(string memory value) internal pure returns (uint256) {
    
        uint size = 0;
        for (uint i = 0; i < bytes(value).length; i++) {
            bytes1 character = bytes(value)[i];
            if (uint8(character) >= 48 && uint8(character) <= 57) {
                size++;
            }
        }

        return size;
    }


    // @returns {bool} - Retorna true se forem diferentes e false se forem iguais.
    function CompareString(string memory a, string memory b) internal pure  returns (bool) {
        return keccak256(abi.encodePacked(a)) != keccak256(abi.encodePacked(b));
    }


    /*
    * Esta função faz a validação e registra na blockchain as informações do eleitor.
    * 
    * @param {string} rg - RG do eleitor.
    * @param {string} cpf - CPF do eleitor.
    * @param {uint256} age - Idade do eleitor.
    * @returns {void}
    */
    function create_person(string memory rg, string memory cpf, uint256 age) public {

        uint256 rg_length = lengthString(rg);
        uint256 cpf_length = lengthString(cpf);

        require(people[msg.sender].age == 0, "Este usuario ja esta cadastrado.");

        require(rg_length >= 5, "size do RG invalido. Por favor, verifique e insira novamente.");
        require(rg_length < 10, "size do RG invalido. Por favor, verifique e insira novamente.");
        require(cpf_length == 11, "O CPF inserido nao possui 11 characters. Por favor, verifique e insira novamente.");

        require(age >= 16, "Idade invalida. Por favor, insira uma idade valida (de 16 anos ou mais).");
        require(age < 150, "Idade invalida.");

        for (uint i = 0; i < addresses.length; i++) {
            require(CompareString(changingStringToRG(rg), people[addresses[i]].RG), "RG invalido");
            require(CompareString(changingStringToCPF(cpf), people[addresses[i]].CPF), "CPF invalido");
        }

        people[msg.sender].RG = changingStringToRG(rg);
        people[msg.sender].CPF = changingStringToCPF(cpf);
        people[msg.sender].age = age;
        addresses.push(msg.sender);

    }


    //       parties_enum
    //  _______________________
    //  | option | num        |
    //  |---------------------|
    //  | PRONA  | 0          |
    //  | ARENA  | 1          |
    //  | PL     | 2          |
    //  | UNIAO  | 3          |
    //  | PT     | 4          |
    //  |________|____________|


    /*
    * Esta função registra na Blockchain o voto do eleitor.
    * 
    * @param {parties_enum} option - Voto do eleitor.
    * @returns {void}
    */
    function Voting(parties_enum option) public {

        require(CompareString(people[msg.sender].CPF, "") , "Eleitor nao cadastrado");
        require(people[msg.sender].voted == false, "Voce ja votou.");
        string memory party;

        if (option == parties_enum.PRONA) {
            party = "PRONA";
            Viewing_Voting.PRONA = Viewing_Voting.PRONA + 1;

        } else if (option == parties_enum.ARENA) {
            party = "ARENA";
            Viewing_Voting.ARENA = Viewing_Voting.ARENA + 1;

        } else if (option == parties_enum.PL) {
            party = "PL";
            Viewing_Voting.PL = Viewing_Voting.PL + 1;

        } else if (option == parties_enum.UNIAO) {
            party = "UNIAO";
            Viewing_Voting.UNIAO = Viewing_Voting.UNIAO + 1;

        } else if (option == parties_enum.PT) {
            party = "PT";
            Viewing_Voting.PT = Viewing_Voting.PT + 1;

        }

        parties[party] = parties[party] + 1;
        people[msg.sender].voted = true;

    }

}
