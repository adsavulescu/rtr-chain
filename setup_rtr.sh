#!/bin/bash
# Initialize RTR Chain with chain ID 7777
./build/rtrd init "RTR-Node" --chain-id rtr_7777-1

# Fix client config
sed -i 's/chain-id = ""/chain-id = "rtr_7777-1"/' ~/.evmosd/config/client.toml

# Add account
echo "fence clip ritual glove resemble sad horn novel angle wrong ketchup beach else town cupboard decrease appear wasp comic coffee end welcome garbage urge" | ./build/rtrd keys add dev --recover --keyring-backend test

# Add genesis account with RTR tokens
./build/rtrd add-genesis-account dev 100000000000000000000000artr --keyring-backend test

# Create validator
./build/rtrd gentx dev 1000000000000000000000artr --keyring-backend test --chain-id rtr_7777-1

# Collect gentxs
./build/rtrd collect-gentxs

echo "RTR Chain setup complete with chain ID 7777!"
