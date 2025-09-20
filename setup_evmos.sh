#!/bin/bash
# Initialize chain
./build/evmosd init testnode --chain-id evmos_9000-1

# Fix client.toml chain ID
sed -i 's/chain-id = ""/chain-id = "evmos_9000-1"/' ~/.evmosd/config/client.toml

# Add test account
echo "fence clip ritual glove resemble sad horn novel angle wrong ketchup beach else town cupboard decrease appear wasp comic coffee end welcome garbage urge" | ./build/evmosd keys add dev --recover --keyring-backend test

# Add account with both Cosmos and EVM balance
./build/evmosd add-genesis-account dev 100000000000000000000000aevmos --keyring-backend test

# Add EVM balance directly in genesis
jq '.app_state.evm.accounts = [{"address":"0x6fab1Efb618EfC59eB9571eAa8E967a090939Dc7","code":"","storage":[]}]' ~/.evmosd/config/genesis.json > /tmp/genesis.json && mv /tmp/genesis.json ~/.evmosd/config/genesis.json

# Create validator 
./build/evmosd gentx dev 1000000000000000000000aevmos --keyring-backend test --chain-id evmos_9000-1

# Collect gentxs
./build/evmosd collect-gentxs

echo "Setup complete!"
