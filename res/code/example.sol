pragma solidity ^0.4.24;

contract Example {
    uint8 public x; // Compiler creates getter
    address private owner; // Only this contract can see variable owner
    
    constructor() public {
        x = 0;
        owner = msg.sender; // The creator of the contract is the owner
    }
    
    event XHasChanged(uint8 oldValue, uint8 newValue);
    event FallBackCalled();

    modifier onlyOwner() {
    	// Pre-conditions
        require(msg.sender == owner,
                "only the owner can modify x"
        );
        _; //Placeholder for the body of the function
        // Put additional post-conditions here
    }
    
    function modifyX(uint8 newValue) 
    public onlyOwner returns (uint8 oldValue) {
        oldValue = x;
        x = newValue;
        emit XHasChanged(oldValue, newValue);
    }
    
    function () public{
        emit FallBackCalled();
    }
    

}