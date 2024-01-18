repo:
	./const.sh
	./ready.sh 

deploy-xcall-evm:
#take const address of xcall while deploying 

#  make deploy-centralized-evm chain=sepolia env=testnet    
	./evm.sh ${env} ${chain}

pull-xcall-jar:
	rm -rf xcall-0.1.0-optimized.jar
	wget https://github.com/icon-project/xcall-multi/releases/download/v1.0.0/xcall-0.1.0-optimized.jar -o xcall.jar

pull-centralized-connection: 
	rm -rf centralize-connection.jar
	# rename the file 
	wget https://github.com/icon-project/xcall-multi/releases/download/v1.2.0/centralized-connection-0.1.0-optimized.jar -o centralize-connection.jar

deploy-xcall-icon:
#make deploy-centralized-icon param=helloNetwork    
	./icon.sh xcall-0.1.0-optimized.jar ${param} 
	
deploy-centralized-connection-icon:
#take const address of xcall while deploying 

#make deploy-centralized-icon param= #remaining   
	./icon.sh centralized-connection-0.1.0-optimized.jar ${param} 
	
deploy_centralise-evm:


# gollop rpc sendtx
# use jq

icon-call-function:
#make icon-call-function to_set=admin arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
#make icon-call-function to_set=protocol-fee-handler arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
#make icon-call-function to_set=protocol-fee arg=1  
	./call.sh ${to_set} ${arg}


set-xcall-fee:
	./evm.sh ${env} ${chain} ${network} ${fee}

call-contract:
	./call.sh 