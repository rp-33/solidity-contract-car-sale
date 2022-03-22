// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CarContract {
  address public owner;
  uint256 public price;
  uint256[] identifier;
  struct Car{
    uint256 identifier;
    string brand;
    uint32 horse;
    uint32 km;
  }
  mapping(address=>Car) cars;

  constructor(uint256 _price){
    price = _price;
    owner = msg.sender;//direccion quien crea el contrato
  }

  modifier priceFilter(uint256 _price){
    require(price == _price);
    _;
  }

  function addCar(uint32 _id,string memory _brand,uint32 _horse,uint32 _km) payable public priceFilter(msg.value){
    identifier.push(_id);
    cars[msg.sender].identifier = _id;
    cars[msg.sender].brand = _brand;
    cars[msg.sender].horse = _horse;
    cars[msg.sender].km = _km;
  }
}
