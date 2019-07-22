pragma solidity 0.5.9;

contract BRLFamilyPlanning {

    constructor (
        address payable partyA,
        string memory partyAname,
        uint RGpartyA,
        uint CPFpartyA,
        address payable partyB,
        string memory partyBname,
        uint RGpartyB,
        uint CPFpartyB,
        string memory place) public payable {
            
        emit PlanningStart(partyA, partyAname, partyB, partyBname, place, now);
        emit PlanningCode((now + CPFpartyA - RGpartyA) + (now + CPFpartyB - RGpartyB));
        
    }
    
    event PlanningStart(address payable, string, address payable, string, string, uint);
    event PlanningCode(uint);
    uint public SendETH;
    event ReceivedETH(uint,  address payable, string);
    
    modifier onlyAfterA {if (SaqueLeo == true) // aqui é o ponto
    _ ;
        
    }
    
    function() external payable {
        SendETH=msg.value;
        require(msg.value > 0);
        emit ReceivedETH(msg.value, msg.sender, "Received Value");
    }

    
    function SaqueLeo(address payable partyA) public payable {
        require(msg.sender == partyA);
        require(address(this).balance > (address(this).balance/2));
        partyA.transfer((address(this).balance) / 2);
    }
    
    function SaqueKa(address payable partyB) public {
        require(msg.sender == partyB);
        require(address(this).balance > (address(this).balance/2));
        partyB.transfer((address(this).balance) / 2);
        
    }
    function mostrarSaldo() public view returns (uint) {
        return address(this).balance;
    }
}
