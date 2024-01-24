#!/bin/bash
source const.sh


function xcall_setAdmin(){
    admin_address=$1
    rpc_url=$2
    contract_address=$(cat ./env/evm/evm_xcall.txt)

    echo "Contract address from file is $contract_address"
    cast send $contract_address "setAdmin(address)" $admin_address --private-key $PRIVATE_KEY  --rpc-url $rpc_url

}
function centralized_connection_setAdmin(){
    admin_address=$1
    rpc_url=$2
    contract_address=$(cat ./env/evm/evm_centralized_connection.txt)

    echo "Contract address from file is $contract_address"
    cast send $contract_address "setAdmin(address)" $admin_address --private-key $PRIVATE_KEY  --rpc-url $rpc_url

}


function xcall_setProtocolFeeHandler(){
    ProtocolFeeHandler_address=$1
    rpc_url=$2
    contract_address=$(cat ./env/evm/evm_xcall.txt)
    echo "Contract address from file is $contract_address"
    cast send $contract_address "setProtocolFeeHandler(address)" $ProtocolFeeHandler_address --private-key $PRIVATE_KEY  --rpc-url $rpc_url

}


function xcall_setProtocolFee(){
    ProtocolFee=$1
    rpc_url=$2
    contract_address=$(cat ./env/evm/evm_xcall.txt)
    echo "Contract address from file is $contract_address"
    cast send $contract_address "setProtocolFee(uint256)" $ProtocolFee --private-key $PRIVATE_KEY  --rpc-url $rpc_url


}

contract_name=$1
to_set=$2
passing_arg=$3
rpc_url=$4

case $contract_name in
    "centralized-connection")
        case $to_set in
            "admin")
                echo "Setting admin on $contract_name with params $passing_arg"
                centralized_connection_setAdmin $passing_arg $rpc_url
            ;;
            "protocol-fee")
                echo "Setting admin on $contract_name with params $passing_arg"
                setProtocolFee $passing_arg $rpc_url
            ;;
            "protocol-fee-handler")
                echo "Setting admin on $contract_name with params $passing_arg"
                setProtocolFeeHandler $passing_arg $rpc_url
            ;;
        esac
    ;;
    "xcall")
        
        case $to_set in
            "admin")
                echo "Setting admin with params $passing_arg"
                xcall_setAdmin $passing_arg $rpc_url
            ;;
            "protocol-fee")
                echo "Setting protocol-fee with params $passing_arg"
                
                xcall_setProtocolFee $passing_arg $rpc_url
            ;;
            "protocol-fee-handler")
                echo "Setting protocol-fee-handler with params $passing_arg"
                
                xcall_setProtocolFeeHandler $passing_arg $rpc_url
            ;;
        esac
    ;;
esac



