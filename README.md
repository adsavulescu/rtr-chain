# RTR Chain

## About

RTR Chain is a high-performance blockchain optimized for decentralized exchange (DEX) operations and high-frequency trading. Built on the Evmos framework, it combines the power of Ethereum Virtual Machine (EVM) compatibility with Cosmos SDK's scalability and the CometBFT consensus engine.

### Key Features

- **Sub-second Block Times**: 500ms block finality for high-frequency trading
- **EVM Compatible**: Full Ethereum compatibility for smart contracts and DApps
- **Low Transaction Fees**: Optimized gas prices for efficient DEX operations
- **Native Token**: RTR (artr for smallest denomination)
- **Chain ID**: `rtr_93769-1`

## Technical Specifications

- **Binary Name**: `evmrtrd`
- **Home Directory**: `~/.evmrtrd`
- **Consensus**: CometBFT with optimized parameters
- **Block Time**: 500ms
- **Min Gas Price**: 0.00001artr

## Quick Start

### Prerequisites

- Go 1.21 or later
- Git
- Make

### Building from Source

```bash
# Clone the repository
git clone git@github.com:adsavulescu/rtr-chain.git
cd rtr-chain

# Build the binary
make build

# The binary will be available at ./build/evmrtrd
```

### Running a Node

```bash
# Initialize the chain
evmrtrd init <your-moniker> --chain-id rtr_93769-1

# Start the node
evmrtrd start --json-rpc.api eth,txpool,net,web3
```

### Running in tmux (Recommended)

```bash
# Create a new tmux session
tmux new-session -s rtr-chain

# Start the node
evmrtrd start --home ~/.evmrtrd --json-rpc.api eth,txpool,net,web3

# Detach from tmux: Ctrl+B, then D
# Reattach to tmux: tmux attach -t rtr-chain
```

## Configuration

The chain is pre-configured for optimal DEX performance:

- **Consensus Timeouts**: Reduced for faster block production
- **Gas Limits**: Increased for complex DEX operations
- **Empty Blocks**: Disabled to optimize network resources

## Development

### Project Structure

```
rtr-chain/
├── app/           # Application logic
├── cmd/evmrtrd/   # CLI commands
├── x/             # Custom modules
├── build/         # Compiled binaries
└── scripts/       # Utility scripts
```

### Testing

```bash
# Run tests
make test

# Run specific tests
go test ./...
```

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

## License

This project is based on Evmos and inherits its licensing structure. See [LICENSE](./LICENSE) for details.

## Acknowledgments

Built on top of:
- [Evmos](https://github.com/evmos/evmos)
- [Cosmos SDK](https://github.com/cosmos/cosmos-sdk)
- [CometBFT](https://github.com/cometbft/cometbft)