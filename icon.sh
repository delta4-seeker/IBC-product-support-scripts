#!/bin/bash
source const.sh

function log_stack() {
	if [[ $PRINT_LOG_STACK == 1 ]];then
	    local cmd=${FUNCNAME[1]}
	    local file=${BASH_SOURCE[1]}
	    if [[ $# > 0 ]]; then cmd="$@"; fi
	    local prefix="$(date '+%Y-%m-%d %H:%M:%S')"
	    awk -v file="$file" -v date="$prefix" -v line=${BASH_LINENO[1]} -v funct=$cmd '
		    BEGIN {
		        printf "\033[0;34m%-20s\033[0;33m%-10s\033[0;36m%-4s\033[0;31m%-19s\n", date, file, line, funct;
		    }
		'
	fi
}

function requireFile() {
	local errorMsg=$2
    if [ ! -f "$1" ]; then
    	# log $errorMsg
        echo "FIle not found"
    fi
}

function icon_wait_tx() {
    log_stack
    local ret=1
    local tx_hash=$1
    [[ -z $tx_hash ]] && return
    # log "tx_hash : ${tx_hash}"
    echo "wait a while...."
    while :; do

        goloop rpc \
            --uri "$ICON_NODE" \
            txresult "$tx_hash" &>/dev/null && break || sleep 1
    done
    local txr=$(goloop rpc --uri "$ICON_NODE" txresult "$tx_hash" 2>/dev/null)
    local status=$(jq <<<"$txr" -r .status)

    # log "status : $status"
    [[ "$status" == 0x0 ]] && echo $txr && exit 0
    [[ "$status" == 0x1 ]] && rset=0
    return $ret1
}

function save_address() {
    log_stack
    local ret=1
    local tx_hash=$1
    local addr_loc=$2
    [[ -z $tx_hash ]] && return
    local txr=$(goloop rpc --uri "$ICON_NODE" txresult "$tx_hash" 2>/dev/null)
    local score_address=$(jq <<<"$txr" -r .scoreAddress)
    echo $score_address > $addr_loc 
    echo "Address saved!"
    # log "contract address : $score_address"
}

function deploy_contract() {
	log_stack
	local jarFile=$1
    local addrLoc=$2

	requireFile $jarFile "$jarFile does not exist"
	# log "deploying contract ${jarFile##*/} with params ${@:3}"
	local params=()
    for i in "${@:3}"; do params+=("--param $i"); done
    echo "Deploying $jarFile with param ${params[@]} and saving address at $addrLoc"
    local tx_hash=$(
        goloop rpc sendtx deploy $jarFile \
	    	--content_type application/java \
	    	--to cx0000000000000000000000000000000000000000 \
	    	$ICON_COMMON_ARGS \
	    	${params[@]} | jq -r .
    )
   	icon_wait_tx "$tx_hash" # wait until the contract is deployed
    save_address "$tx_hash" $addrLoc # save scoreAddress
}

contract=$1
parameter=$2

case $contract in 
    "centralized-connection")
        jar_file=centralized-connection.jar
        save_address=env/icon/icon_centralized_connection.txt
        xcall_address=$(cat env/icon/icon_xcall.txt)
        deploy_contract $jar_file $save_address _relayer=$parameter _xCall=$xcall_address
        ;;
    "xcall")

        jar_file=xcall.jar
        save_address=env/icon/icon_xcall.txt
        deploy_contract $jar_file $save_address networkId=$parameter
        ;;
esac


# deploy_contract "xcall-0.1.0-optimized.jar" "address_location_remaining" networkId=$1