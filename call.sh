#!/bin/bash
source const.sh


function setAdmin(){
admin_address=$1 
# hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
contract_address=$(cat ./env/icon/centralized_connection.txt) 
echo "COntract address from file is $contract_address"

      goloop rpc sendtx call $jarFile \
	    	--to $contract_address \
	    	$ICON_COMMON_ARGS \
            --method setAdmin \
            --param _address=$admin_address
}


function setProtocolFeeHandler(){
ProtocolFeeHandler_address=$1 
# hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
contract_address=$(cat ./env/icon/centralized_connection.txt) 
echo "COntract address from file is $contract_address"

      goloop rpc sendtx call $jarFile \
	    	--to $contract_address \
	    	$ICON_COMMON_ARGS \
            --method setProtocolFeeHandler \
            --param _address=$ProtocolFeeHandler_address
}


function setProtocolFee(){
ProtocolFee=$1 
# 1
contract_address=$(cat ./env/icon/centralized_connection.txt) 
echo "COntract address from file is $contract_address"

      goloop rpc sendtx call $jarFile \
	    	--to $contract_address \
	    	$ICON_COMMON_ARGS \
            --method setProtocolFee \
            --param _protocolFee=$ProtocolFee
}

to_set=$1 
passing_arg=$2

case $to_set in 
    "admin") 
    echo "Setting admin with params $passing_arg"
        setAdmin $passing_arg
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


