pragma solidity ^0.4.25;

contract EStore {
    
    enum ProductCondition {New, Used}
    
    uint public productIndex;
    
    // Look up products by seller's address
    mapping (address => mapping (uint => Product)) stores;
    // Look up seller by product id
    mapping (uint => address) productIdInStore;
    
    struct Product {
        uint id;
        string name;
        string category;
        string imageLink;
        string descLink;
        uint createdAt;
        uint price;
        address buyer;
    }
    
    constructor() public {
        productIndex = 0;
    }
    
}