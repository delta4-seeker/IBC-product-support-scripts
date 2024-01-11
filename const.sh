#!/bin/bash


# I AS AN DEPLOYER, WILL CHANGE THE FOLLOWING THINGS TO DEPLOY CONTRACTS

export EVM_CHAIN=avalanche
export EVM_NET=mainnet

export ICON_NET=mainnet # goloop, lisbon, berlin, mainnet


export ICON_WALLET=$HOME/keystore/icon.json
export ICON_PASSWORD=gochain

# for evm
export PRIVATE_KEY=
export ADMIN=
export OWNER=

# api keys for verification
# create account in all trackers and get the api key
export BSCSCAN_API_KEY=
export ETHERSCAN_API_KEY=
export BASESCAN_API_KEY=
export OPTIMISMSCAN_API_KEY=
export ARBITRUMSCAN_API_KEY=
export SNOWSCAN_API_KEY=


## I SHOULD NOT HAVE TO CHANGE ANYTHING DOWN HERE, CHAIN RELATED INFO

export ROOT_DIR=$PWD


### make sure, these evm variables match .env file in the contracts/evm/.env file

## MAINNET
export BSC_RPC_URL=
export BSC_NID=


export ETHEREUM_RPC_URL=
export ETHEREUM_NID=


export BASE_RPC_URL=
export BASE_NID=


export AVALANCHE_RPC_URL=
export AVALANCHE_NID=


export ARBITRUM_RPC_URL=
export OPTIMISM_NID=


export AVALANCHE_RPC_URL=
export ARBITRUM_NID=


## TESTNET 
export BSCTEST_RPC_URL=
export BSCTEST_NID=


export SEPOLIA_RPC_URL=
export SEPOLIA_NID=

export BASE_GOERLI_RPC_URL=
export BASE_GOERLI_NID=


export OPTIMISM_GOERLI_RPC_URL=
export OPTIMISM_GOERLI_NID=


export ARBITRUM_GOERLI_RPC_URL=
export ARBITRUM_GOERLI_NID=

export FUJI_RPC_URL=
export FUJI_NID=


case $ICON_NET in 
	"goloop" )
		export ICON_NID=3
		export ICON_NODE=http://localhost:9082/api/v3/
		export ICON_DEBUG_NODE=http://localhost:9082/api/v3d
		export ICON_NETWORK_ID=0x3.icon
	;;
	"berlin" )
		export ICON_NID=7
		export ICON_NODE=https://berlin.net.solidwallet.io/api/v3/
		export ICON_DEBUG_NODE=https://berlin.net.solidwallet.io/api/v3d
		export ICON_NETWORK_ID=0x7.icon
	;;
	"lisbon" )
		export ICON_NID=2
		export ICON_NODE=https://lisbon.net.solidwallet.io/api/v3/
		export ICON_DEBUG_NODE=https://lisbon.net.solidwallet.io/api/v3d
		export ICON_NETWORK_ID=0x2.icon
	;;
	"mainnet" )
		export ICON_NID=1
		export ICON_NODE=https://ctz.solidwallet.io/api/v3/
		export ICON_DEBUG_NODE=https://ctz.solidwallet.io/api/v3d
		export ICON_NETWORK_ID=0x1.icon
	;;
esac


export ICON_COMMON_ARGS=" --uri $ICON_NODE --nid $ICON_NID --step_limit 4000000000 --key_store $ICON_WALLET --key_password $ICON_PASSWORD "
export CONTRACT_ENV=$ROOT_DIR/env
# mkdir -p $CONTRACT_ENV 
# evm_env = contract_env/$evm_chainname...$env
# icon_env
