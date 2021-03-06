pragma solidity ^0.4.24;

contract EStore {
    
    enum ProductCondition {New, Used}
    
    uint public productIndex;
    
    // Look up product by seller's address
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
        ProductCondition condition;
        address buyer;
    }
    
    constructor() public {
        productIndex = 0;
    }

    function addProductToStore(string _name, string _category, string _imageLink, string _descLink, uint _createdAt, uint _price, uint _condition) public {
        productIndex += 1;
        Product memory product = Product(productIndex, _name, _category, _imageLink, _descLink, _createdAt, _price, ProductCondition(_condition), 0);
        stores[msg.sender][productIndex] = product;
        productIdInStore[productIndex] = msg.sender;    
    }
    
    function getProduct(uint _productId) public view returns (uint, string, string, string, string, uint, uint, ProductCondition, address) {
        Product memory product = stores[productIdInStore[_productId]][_productId];
        return (product.id, product.name, product.category, product.imageLink, product.descLink, product.createdAt, product.price, product.condition, product.buyer);
    }
}