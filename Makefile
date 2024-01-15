repo:
	./const.sh
	./ready.sh 

deploy-centralized-evm:
	./evm.sh ${env} ${chain}

pull-xcall-jar:
	rm -rf xcall-0.1.0-optimized.jar
	wget https://github.com/icon-project/xcall-multi/releases/download/v1.0.0/xcall-0.1.0-optimized.jar

deploy-centralized-icon:
	./icon.sh

centralized-fee:
	./evm.sh ${env} ${chain} ${network} ${fee}

