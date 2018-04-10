pragma solidity ^0.4.0;


interface Regulator {
    function Checkvalue(uint amount) returns (bool);
    function loan() returns (bool);
}

contract Bank is Regulator{
    uint private value;
    
    function Bank(uint amount){
        value = amount;
    }
    
    function Deposit(uint amount){
        value += amount;
    }
    
    function Withdraw(uint amount){
        if (Checkvalue(amount)){
            value -= amount;
        }
        
    }
    
    function Balance() returns (uint){
        return value;
    }
    
    function Checkvalue(uint amount) returns (bool){
        return amount >= value;
    }
    function loan() returns (bool){
        return value > 0;
    }
}

contract MyFirstContract is Bank(10) {
    
    string private name;
    uint private age;
    
    function setName(string NewName) {
        name = NewName;
    }
    
    function getName() returns (string){
        return name;
    }
    
    function setAge( uint NewAge) {
        age = NewAge;
    }
    
    function getAge() returns (uint){
        return age;
    }
    
}