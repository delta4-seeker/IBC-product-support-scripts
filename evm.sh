#!/bin/bash 

function deploy_evm_centralized() {
    local env=$1
    local chain=$2
    cd ~/Desktop/ibriz/xcall-multi/contracts/evm
    forge clean
    ./deploy_script.sh --contract centralized  --deploy --env $env --chain $chain
    cd $ROOT_DIR
}

function evm_set_fee() {
    local env=$1
    local chain=$2
    cd $ROOT_DIR/xcall-multi/contracts/evm
    forge clean
    # cast command 
    cd $ROOT_DIR
}

# function evm_set_admin() {
#     # similar 
# }


# valid_testnet_chains=("sepolia" "bsc_testnet" "fuji" "arbitrum_goerli" "optimism_goerli" "base_goerli" "all")
function deploy_at_testnet() {
    local chain=$1
    case $chain in 
        "avalance")
            chain="fuji"
            ;;
        "binance")
            chain="bsc_testnet"
            ;;
        "arbitrum")
            chain="arbitrum_goerli"
            ;;
        "optimism")
            chain="optimism_goerli"
            ;;
        "base")
            chain="base_goerli"
            ;;
    esac
    deploy_evm_centralized testnet $chain

}

# valid_mainnet_chains=("ethereum" "binance" "avalanche" "arbitrum" "optimism" "base" "all")
function deploy_at_mainnet() {
    deploy_evm_centralized mainnet $1
}

 env=$1
 chain_name=$2 
case $env in 
    "testnet") 
        deploy_at_testnet $chain_name # 
        ;;
    "mainnet")
        deploy_at_mainnet $chain_name
        ;;
esac
