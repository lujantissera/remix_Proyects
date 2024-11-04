// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract bid{

    uint256 maxBid;
    address public owner;
    address maxBideer;
    uint256 public finishTimeStamp;
    uint256 public minBidIncrement;

    event NewBid(address indexed bidder, uint256 amount);
    event AuctionEnded(address winner, uint256 amount);
/**
     * @dev Inicializa el contrato de subasta.
     * @param _durationInSeconds La duración de la subasta en segundos.
     * @param _minBidIncrement El incremento mínimo para cada oferta.
     */
    constructor(uint256 _durationInSeconds, uint256 _minBinIncrement){
        owner = msg.sender;
        finishTimeStamp = block.timestamp + _durationInSeconds; 
        minBidIncrement = _minBinIncrement;
    }
 //* @dev Modificador para verificar si la subasta aún está activa.
    modifier validateTime(){
        require(block.timestamp < finishTimeStamp, "Time to offer has ended");
        _;
    }
/***
*@dev Función para ofertar: Permite a los participantes ofertar por el artículo.
 Para que una oferta sea válida debe ser mayor que la mayor oferta actual al menos en 5% y 
 debe realizarse mientras la subasta esté activa.***/
    function makeBid()external payable  validateTime {
        uint minBid = (maxBid *5)/100;
        require(msg.value > minBid , "La oferta es inferior a lo permitido" );

        if (msg.value > maxBid){
            maxBid = msg.value;
            maxBideer = msg.sender;
            if (block.timestamp >= finishTimeStamp - 10 minutes) {
            finishTimeStamp += 10 minutes; //Luego de una nueva oferta valida se extiende 10 minutos el tiempo para ofertar (Si se encuentra en los ultimos 10 minutos)
        }
        }
        emit NewBid(msg.sender, msg.value);
        }
//Mostrar ganador: Muestra el ofertante ganador y el valor de la oferta ganadora.//
    function getWinner()external payable returns (address, uint256) {
        return (maxBideer,maxBid);
    }       

//Mostrar ofertas: Muestra la lista de ofertantes y los montos ofrecidos.
    function getOfertas()external  payable (){

    }
//Funcion para devolver el deposito 
    function returnDeposti()
      
    

}