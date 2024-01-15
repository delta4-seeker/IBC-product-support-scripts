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
    echo "Node is $ICON_NODE"
    # while :; do

    # echo "searching $tx_hash"
    #     goloop rpc \
    #         --uri "$ICON_NODE" \
    #         txresult "$tx_hash" && break || sleep 2
    # done
    sleep 5 
#goloop rpc  --uri "https://lisbon.net.solidwallet.io/api/v3/" txresult "0xc4c8a07d247bbf43e655bcd4b361d9702fac5be281f6d0687a989ce44db73c62"
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
    echo $tx_hash > $addr_loc 
    # not working below
    [[ -z $tx_hash ]] && return
    local txr=$(goloop rpc --uri "$ICON_NODE" txresult "$tx_hash" 2>/dev/null)
    local score_address=$(jq <<<"$txr" -r .scoreAddress)
    # echo $score_address > $addr_loc
    # log "contract address : $score_address"
}

function deploy_contract() {
	log_stack
	local jarFile="xcall-0.1.0-optimized.jar"
    local addrLoc=$AADR_LOC
	requireFile $jarFile "$jarFile does not exist"
	# log "deploying contract ${jarFile##*/} with params ${@:3}"

	local params=()
    for i in "${@:3}"; do params+=("--param $i"); done

    local tx_hash=$(
        goloop rpc sendtx deploy $jarFile \
	    	--content_type application/java \
	    	--to cx0000000000000000000000000000000000000000 \
	    	$ICON_COMMON_ARGS \
            --param networkId=myNetwork \ #try using above param
	    	# ${params[@]} | jq -r .
    )
        echo "The transaction hash is $tx_hash" 

   	icon_wait_tx "$tx_hash" #bug here 

    save_address "$tx_hash" $addrLoc # save scoreAddress
}

deploy_contract