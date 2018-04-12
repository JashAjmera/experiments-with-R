pragma solidity ^0.4.0;

contract Election {
    
    struct Candidate {
        string name;
        uint votecount;
    }
    
    struct Voter {
        bool voted;
        uint voteindex;
        uint weight;
    }
    
    address public owner;
    string public name;
    mapping (address => Voter) public voters;
    Candidate [] public candidates;
    uint public auctionend;
    
    
    event ElectionResult(string name, uint votecount);
    
    
    function Election(string _name, uint durationminutes, string candidate1, string candidate2) {
        name = _name;
        owner = msg.sender;
        auctionend = now + (durationminutes * 1 minutes);
        candidates.push(Candidate(candidate1,0));
        candidates.push(Candidate(candidate2,0));
    }
    
    function authorize(address voter){
        require (msg.sender == owner);
        require(!voters[voter].voted);

        voters[voter].weight =1;
    }


    function vote(uint voteindex){
        require(now < auctionend);
        require(!voters[msg.sender].voted);

        voters[msg.sender].voted = true;
        voters[msg.sender].voteindex = voteindex;
        
        candidates[voteindex].votecount += voters[msg.sender].weight;
    }
    
    
    function end() {
        require(msg.sender == owner);
        require(now > auctionend);
        
        for(uint i=0;i<candidates.length;i++){
            ElectionResult(candidates[i].name,candidates[i].votecount);
        }
    }
}
