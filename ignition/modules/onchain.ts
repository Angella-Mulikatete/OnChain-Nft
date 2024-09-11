import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const NFTModule = buildModule("NFTModule", (m) => {


  const onchain = m.contract("OnChainNFT", []);

  return { onchain };
});

export default NFTModule;
