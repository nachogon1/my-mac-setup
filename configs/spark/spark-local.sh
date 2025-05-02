#!/bin/zsh

# Script to set up workers and master. Run $SPARK_HOME/sbin/stop-worker.sh to stop workers. 
SPARK_WORKER_CORES=1 
SPARK_WORKER_MEMORY=2g
SPARK_WORKER_INSTANCES=6 
$SPARK_HOME/sbin/start-worker.sh spark://Ignacios-MacBook-Pro-2.local:7077 --cores 1
$SPARK_HOME/sbin/start-master.sh
pyspark \ 
  --conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
  --packages org.apache.spark:spark-hadoop-cloud_2.13:3.3.4,com.amazonaws:aws-java-sdk-bundle:1.11.901,org.apache.hadoop:hadoop-aws:3.3.4
