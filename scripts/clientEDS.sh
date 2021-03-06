#!/bin/sh

# Check parameters
if [ $# -lt 3 ] ; then
	echo "usage: $0 <client-id> <config-dir> <extension-code-dir>"
	exit
fi

CLIENT_ID=$1
CFG_DIR=$2
EXT_DIR=$3

# Change directory
DIR=$(cd `dirname $0` && pwd)
cd $DIR/..

CLASSPATH=bin/depspace.jar
CLASSPATH=$CLASSPATH:lib/SMaRt-eds.jar:lib/PVSS.jar:lib/commons-codec-1.5.jar
CLASSPATH=$CLASSPATH:lib/core-0.1.4.jar:lib/groovy-1.0-JSR-06.jar:lib/netty-all-4.0.25.Final.jar
CLASSPATH=$CLASSPATH:lib/slf4j-api-1.5.8.jar:lib/slf4j-jdk14-1.5.8.jar

java -cp $CLASSPATH depspace.demo.EDSDemoClient $CLIENT_ID $CFG_DIR $EXT_DIR
