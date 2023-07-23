const MaisonMetaverse = artifacts.require("MaisonMetaverse");
const ConvertLib = artifacts.require("ConvertLib");
const MetaCoin = artifacts.require("MetaCoin");

module.exports = function(deployer) {
  deployer.deploy(MaisonMetaverse);
};
