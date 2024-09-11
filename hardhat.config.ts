import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import { vars } from "hardhat/config";

const ETHERSCAN_API_KEY = vars.get("ETHERSCAN_API_KEY");
const PRIVATE_KEY = vars.get("PRIVATE_KEY")


const config: HardhatUserConfig = {
  solidity: "0.8.24",
   networks: {
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/jQytdmthVH4e4znyeYU1M3CfWPTwbWhl", // use your Infura key
      accounts: [PRIVATE_KEY], // use your private key
    },
    
  },
   etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};

export default config;
