#!/bin/zsh

# Script to set up workers and master. Run $SPARK_HOME/sbin/stop-worker.sh to stop workers.
export SPARK_WORKER_INSTANCES=4
SPARK_WORKER_CORES=2 
SPARK_WORKER_MEMORY=2g
SPARK_WORKER_INSTANCES=4 
$SPARK_HOME/sbin/start-worker.sh spark://Ignacios-MacBook-Pro-2.local:7077
$SPARK_HOME/sbin/start-master.sh
pyspark
