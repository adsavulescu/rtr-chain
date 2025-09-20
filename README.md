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
- Make (for Linux/macOS) or MinGW (for Windows)

### Platform Support

RTR Chain runs on multiple platforms:
- **Linux** (Ubuntu, Debian, CentOS, etc.)
- **macOS** (Intel and Apple Silicon)
- **Windows** (Native or WSL2)

### Building from Source

#### Linux/macOS

```bash
# Clone the repository
git clone git@github.com:adsavulescu/rtr-chain.git
cd rtr-chain

# Build the binary
make build

# The binary will be available at ./build/evmrtrd
```

#### Windows (Native)

```powershell
# Clone the repository
git clone git@github.com:adsavulescu/rtr-chain.git
cd rtr-chain

# Build the binary
go build -o build\evmrtrd.exe .\cmd\evmrtrd

# The binary will be available at .\build\evmrtrd.exe
```

#### Windows (WSL2) - Recommended

```bash
# Install WSL2 if not already installed
# Then follow Linux instructions above
```

### Running a Node

#### Linux/macOS

```bash
# Initialize the chain
evmrtrd init <your-moniker> --chain-id rtr_93769-1

# Start the node
evmrtrd start --json-rpc.api eth,txpool,net,web3
```

#### Windows

```powershell
# Initialize the chain
evmrtrd.exe init <your-moniker> --chain-id rtr_93769-1

# Start the node
evmrtrd.exe start --json-rpc.api eth,txpool,net,web3

# Or run in background
Start-Process -NoNewWindow -FilePath "evmrtrd.exe" -ArgumentList "start --json-rpc.api eth,txpool,net,web3"
```

### Running as a Service

#### Linux (systemd)

Create `/etc/systemd/system/rtr-chain.service`:

```ini
[Unit]
Description=RTR Chain Node
After=network.target

[Service]
Type=simple
User=<your-user>
WorkingDirectory=/home/<your-user>
ExecStart=/usr/local/bin/evmrtrd start --home /home/<your-user>/.evmrtrd --json-rpc.api eth,txpool,net,web3
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
```

Then:
```bash
sudo systemctl enable rtr-chain
sudo systemctl start rtr-chain
```

#### Windows (Service)

Using NSSM (Non-Sucking Service Manager):

```powershell
# Download NSSM from https://nssm.cc/download
# Install the service
nssm install RTRChain "C:\path\to\evmrtrd.exe" "start --json-rpc.api eth,txpool,net,web3"

# Start the service
nssm start RTRChain
```

### Docker Support

```dockerfile
# Dockerfile example
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o evmrtrd ./cmd/evmrtrd

FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /app/evmrtrd /usr/local/bin/
EXPOSE 26656 26657 8545 8546
CMD ["evmrtrd", "start"]
```

```bash
# Build and run with Docker
docker build -t rtr-chain .
docker run -d -p 26657:26657 -p 8545:8545 rtr-chain
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