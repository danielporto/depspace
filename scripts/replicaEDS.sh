#!/bin/sh

# Check parameters
if [ $# -lt 2 ] ; then
	echo "usage: $0 <replica-id> <config-dir>"
	exit
fi

REPLICA_ID=$1
CFG_DIR=$2

# Change directory
DIR=$(cd `dirname $0` && pwd)
cd $DIR/..

CLASSPATH=bin/depspace.jar
CLASSPATH=$CLASSPATH:lib/SMaRt-eds.jar:lib/PVSS.jar:lib/commons-codec-1.5.jar
CLASSPATH=$CLASSPATH:lib/core-0.1.4.jar:lib/groovy-1.0-JSR-06.jar:lib/netty-all-4.0.25.Final.jar
CLASSPATH=$CLASSPATH:lib/slf4j-api-1.5.8.jar:lib/slf4j-jdk14-1.5.8.jar

java -cp $CLASSPATH depspace.server.DepSpaceReplica $REPLICA_ID $CFG_DIR
