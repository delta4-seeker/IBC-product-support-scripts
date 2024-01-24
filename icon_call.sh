#!/bin/bash
source const.sh


function xcall_setAdmin(){
    admin_address=$1
    # hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
    Contract_address=$(cat ./env/icon/icon_xcall.txt)
    echo "Contract address from file is $Contract_address"
    
    goloop rpc sendtx call $jarFile \
    --to $Contract_address \
    $ICON_COMMON_ARGS \
    --method setAdmin \
    --param _address=$admin_address
}
function centralized_connection_setAdmin(){
    admin_address=$1
    # hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
    Contract_address=$(cat ./env/icon/icon_centralized_connection.txt)
    echo "Contract address from file is $Contract_address"
    
    goloop rpc sendtx call $jarFile \
    --to $Contract_address \
    $ICON_COMMON_ARGS \
    --method setAdmin \
    --param _relayer=$admin_address
}


function xcall_setProtocolFeeHandler(){
    ProtocolFeeHandler_address=$1
    # hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
    Contract_address=$(cat ./env/icon/icon_xcall.txt)
    echo "Contract address from file is $Contract_address"
    
    goloop rpc sendtx call $jarFile \
    --to $Contract_address \
    $ICON_COMMON_ARGS \
    --method setProtocolFeeHandler \
    --param _address=$ProtocolFeeHandler_address
}


function xcall_setProtocolFee(){
    ProtocolFee=$1
    # 1
    Contract_address=$(cat ./env/icon/icon_xcall.txt)
    echo "Contract address from file is $Contract_address"
    
    goloop rpc sendtx call $jarFile \
    --to $Contract_address \
    $ICON_COMMON_ARGS \
    --method setProtocolFee \
    --param _protocolFee=$ProtocolFee
}

contract_name=$1
to_set=$2
passing_arg=$3

case $contract_name in
    "centralized-connection")
        echo "this is a x call function clal"
        case $to_set in
            "admin")
                echo "Setting admin with params $passing_arg"
                centralized_connection_setAdmin $passing_arg
            ;;
            "protocol-fee")
                echo "Setting protocol-fee with params $passing_arg"
                
                setProtocolFee $passing_arg
            ;;
            "protocol-fee-handler")
                echo "Setting protocol-fee-handler with params $passing_arg"
                
                setProtocolFeeHandler $passing_arg
            ;;
        esac
    ;;
    "xcall")
        echo "this is a centralized connection function call"
        
        case $to_set in
            "admin")
                echo "Setting admin with params $passing_arg"
                xcall_setAdmin $passing_arg
            ;;
            "protocol-fee")
                echo "Setting protocol-fee with params $passing_arg"
                
                xcall_setProtocolFee $passing_arg
            ;;
            "protocol-fee-handler")
                echo "Setting protocol-fee-handler with params $passing_arg"
                
                xcall_setProtocolFeeHandler $passing_arg
            ;;
        esac
    ;;
esac



