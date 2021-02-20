async function main() {

    const [deployer] = await ethers.getSigners();

    console.log(
        "Deploying contracts with the account:",
        deployer.address
    );

    console.log("Account balance:", (await deployer.getBalance()).toString());

    const MyOperator = await ethers.getContractFactory("MyOperator");
    const operator = await MyOperator.deploy("0x8812f219f507e8cfe9d2f1e790164714c5e06a73");

    console.log("Operator address:", operator.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });