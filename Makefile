repo:
	./const.sh
	./ready.sh 


pull-xcall-jar:
	rm -rf xcall.jar
	wget https://github.com/icon-project/xcall-multi/releases/download/v1.0.0/xcall-0.1.0-optimized.jar
	mv xcall-0.1.0-optimized.jar xcall.jar
	

pull-centralized-connection-jar: 
	rm -rf centralize-connection.jar
	wget https://github.com/icon-project/xcall-multi/releases/download/v1.2.0/centralized-connection-0.1.0-optimized.jar
	mv centralized-connection-0.1.0-optimized.jar centralized-connection.jar

deploy-icon:

	./icon.sh ${contract} ${param}

icon-call-function:

	./icon_call.sh ${contract} ${to_set} ${arg}



deploy-evm:
	./evm.sh ${contract} ${env} ${chain}

evm-call-function:
# to test rpc_url , use $BSC_TESTNET_RPC_URL
	./evm_call.sh ${contract} ${to_set} ${arg} ${rpc-url}

