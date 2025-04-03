// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";

contract AlcanciaDigital {
    address public owner;
    uint public cantidadObjetivo;
    string public nombreAlcancia;
    bool public alcanciaAbierta;

    constructor(string memory _nombreInicial, uint _objetivoInicial) {
        owner = msg.sender;
        nombreAlcancia = _nombreInicial;
        cantidadObjetivo = _objetivoInicial;
        alcanciaAbierta = true;
    }

    modifier soloOwner() {
        require(msg.sender == owner, "No eres el dueno");
        _;
    }

    function depositarFondos(uint _cantidadFondos) public payable {
        require(alcanciaAbierta, "La alcancia esta cerrada");
        require(_cantidadFondos > 0, "Debe depositar fondos");
        
        cantidadObjetivo += _cantidadFondos;
        
    }

    function cambiarNombre(string memory _nuevoNombre) public soloOwner {
        nombreAlcancia = _nuevoNombre;
    }

    function cambiarObjetivo(uint _nuevoObjetivo) public soloOwner {
        cantidadObjetivo = _nuevoObjetivo;
    }

    function cambiarEstadoAlcancia() public soloOwner {
        alcanciaAbierta = !alcanciaAbierta;
    }

    function obtenerBalance() public view returns (uint) {
    return address(this).balance;
        }

    function consultarObjetivo() public view returns (string memory) {
         if (cantidadObjetivo <= address(this).balance) {
        return "Objetivo Alcanzado";
        } else {
        uint restante = cantidadObjetivo - address(this).balance;
            return string(abi.encodePacked("Objetivo no alcanzado, faltan $", Strings.toString(restante), " wei"));
        }}
        // 
   

    }
