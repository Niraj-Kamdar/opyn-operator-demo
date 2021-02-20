require("@nomiclabs/hardhat-waffle");
const config = require("./infura_exports");

module.exports = {
  solidity: "0.6.10",
  networks: {
    ropsten: {
      url: `https://ropsten.infura.io/v3/${config.projectId}`,
      accounts: [`0x${config.privateKey}`]
    },
    goerli: {
      url: `https://goerli.infura.io/v3/${config.projectId}`,
      accounts: [`0x${config.privateKey}`]
    },
    kovan: {
      url: `https://kovan.infura.io/v3/${config.projectId}`,
      accounts: [`0x${config.privateKey}`]
    },
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${config.projectId}`,
      accounts: [`0x${config.privateKey}`]
    }
  }
};
