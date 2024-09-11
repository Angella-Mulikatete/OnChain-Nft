import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import { vars } from "hardhat/config";

const ETHERSCAN_API_KEY = vars.get("ETHERSCAN_API_KEY");

const config: HardhatUserConfig = {
  solidity: "0.8.24",
   networks: {
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/jQytdmthVH4e4znyeYU1M3CfWPTwbWhl", // use your Infura key
      accounts: ["45a71309065d92d987010d97253ab26b0406f338b8de46a9c4f267d305c5d1fa"], // use your private key
    },
    
  },
   etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};

export default config;
