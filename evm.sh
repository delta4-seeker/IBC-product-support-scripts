#!/bin/bash 
# write contract address
function deploy_evm() {
    local contract=$1
    local env=$2
    local chain=$3
    echo "deploying $contract on $chain $env"
    # cd $ROOT_DIR/xcall-multi/contracts/evm
    cd ~/Desktop/centralized-relay/xcall-multi/contracts/evm
    forge clean
    ./deploy_script.sh --contract $contract --deploy --env $env --chain $chain 
    cd $ROOT_DIR
}

# function evm_set_admin() {
#     local admin_address=$1
#     cd $ROOT_DIR/xcall-multi/contracts/evm

#     export CONTRACT_ADDRESS=<your-contract-address> # read from file 
#     export PRIVATE_KEY=<your-contract-address> # hard code or take from cli ? 
    
#     forge clean
#     # are chain NID and below address same ?

#     # cast send $CONTRACT_ADDRESS "setAdmin(address)" 0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc --private-key $PRIVATE_KEY
#     # cast send $CONTRACT_ADDRESS "setAdmin(address)" "ENTER Chain NID HERE" --private-key $PRIVATE_KEY
#     cast send $CONTRACT_ADDRESS "setAdmin(address)" $admin_address --private-key $PRIVATE_KEY
#     cd $ROOT_DIR
# }

# function evm_set_fee() {
#     # similar 
# }


# valid_testnet_chains=("sepolia" "bsc_testnet" "fuji" "arbitrum_goerli" "optimism_goerli" "base_goerli" "all")
function deploy_at_testnet() {
    local contract=$1
    local chain=$2
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
    deploy_evm $contract testnet $chain

}

# valid_mainnet_chains=("ethereum" "binance" "avalanche" "arbitrum" "optimism" "base" "all")

contract=$1
 env=$2
 chain_name=$3 

case $env in 
    "testnet") 
    deploy_at_testnet $contract $chain_name
        ;;
    "mainnet")
    deploy_evm $contract mainnet $chain_name
        ;;
esac
