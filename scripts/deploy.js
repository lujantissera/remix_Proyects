const hre = require("hardhat");

async function main() {
  const nombreInicial = "Mi Alcancia"; // Nombre inicial de la alcancía
  const cantidadObjetivo = hre.ethers.parseUnits("1", "ether"); // Objetivo inicial en wei

  // Obtener la fábrica del contrato
  const Alcancia = await hre.ethers.getContractFactory("Alcancia");

  // Desplegar el contrato con los argumentos requeridos
  const alcancia = await Alcancia.deploy(nombreInicial, cantidadObjetivo);

  console.log("Desplegando contrato...");
  await alcancia.waitForDeployment(); // Esperar a que el despliegue se complete
  console.log(`AlcanciaDigital desplegada en: ${alcancia.target}`); // Dirección del contrato desplegado
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});