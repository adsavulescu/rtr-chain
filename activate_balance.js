const ethers = require('ethers');

async function activateBalance() {
  const provider = new ethers.JsonRpcProvider('http://localhost:8545');
  const privateKey = '0x6FDA689614F3244278EF9AFA443E2DB1E7324E24E84832015479AE33812D47CF';
  const wallet = new ethers.Wallet(privateKey, provider);
  
  // Send 0 ETH to self to activate balance
  const tx = await wallet.sendTransaction({
    to: wallet.address,
    value: 0,
    gasLimit: 21000,
    gasPrice: ethers.parseUnits('1000', 'gwei')
  });
  
  console.log('Transaction hash:', tx.hash);
  await tx.wait();
  console.log('Balance activated!');
}

activateBalance().catch(console.error);
