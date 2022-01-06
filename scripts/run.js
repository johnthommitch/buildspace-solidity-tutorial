const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const chickenFarmFactory = await hre.ethers.getContractFactory("ChickenFarm");
    const chickenFarm = await chickenFarmFactory.deploy();
    await chickenFarm.deployed();

    console.log("Contract deployed to: ", chickenFarm.address);
    console.log("Contract deployed by: ", owner.address);

    let hatchCount;
    hatchCount = await chickenFarm.getChickenCount(); 

    let hatchTxn = await chickenFarm.hatch();
    await hatchTxn.wait();

    hatchCount = await chickenFarm.getChickenCount();

    hatchTxn = await chickenFarm.connect(randomPerson).hatch();
    await hatchTxn.wait();

    hatchCount = await chickenFarm.getChickenCount();

    hatchTxn = await chickenFarm.connect(randomPerson).hatch();
    await hatchTxn.wait();

    hatchCount = await chickenFarm.getChickenCount();

    
};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();