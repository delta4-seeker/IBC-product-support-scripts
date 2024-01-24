repo:
	./const.sh
	./ready.sh 


# deploy xcall and centralise-conection in icon 
pull-xcall-jar:
	rm -rf xcall.jar
	wget https://github.com/icon-project/xcall-multi/releases/download/v1.0.0/xcall-0.1.0-optimized.jar
	mv xcall-0.1.0-optimized.jar xcall.jar
	

pull-centralized-connection-jar: 
	rm -rf centralize-connection.jar
	wget https://github.com/icon-project/xcall-multi/releases/download/v1.2.0/centralized-connection-0.1.0-optimized.jar
	mv centralized-connection-0.1.0-optimized.jar centralized-connection.jar

deploy-icon:
#make deploy-icon contract=xcall param=helloNetwork    
#make deploy-icon contract=centralized-connection param=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a    
	./icon.sh ${contract} ${param}

icon-call-function:
#make icon-call-function contract=xcall to_set=admin arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
#make icon-call-function contract=xcall to_set=protocol-fee-handler arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
#make icon-call-function contract=xcall to_set=protocol-fee arg=1 

#make icon-call-function contract=centralized-connection to_set=admin arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a

	./icon_call.sh ${contract} ${to_set} ${arg}
#deploy xcall in evm 
#deploy centralise in evm 


deploy-evm:
#take const address of xcall while deploying 

#  make deploy-evm contract=xcall chain=sepolia env=testnet    
#  make deploy-evm contract=centralized-connection chain=sepolia env=testnet    
	./evm.sh ${contract} ${env} ${chain}

evm-call-function:
#make evm-call-function contract=centralized-connection to_set=admin arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
#make evm-call-function contract=xcall to_set=admin arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
#make evm-call-function contract=xcall to_set=protocol-fee-handler arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a
#make evm-call-function contract=xcall to_set=protocol-fee arg=1 

#make evm-call-function contract=centralized-connection to_set=admin arg=hx6729a1443eaa63d77a359c8ba76bd3e1f2bcc61a

	./evm_call.sh ${contract} ${to_set} ${arg}

