#!/bin/zsh

# Check if hostname was passed as argument
if [ -z "$1" ]; then
  echo "Usage: $0 <your-local-hostname>"
  exit 1
fi

HOSTNAME=$1

# Spark worker config
export SPARK_WORKER_CORES=1
export SPARK_WORKER_MEMORY=2g
export SPARK_WORKER_INSTANCES=6

# Start Spark master
$SPARK_HOME/sbin/start-master.sh

# Start Spark worker in background (daemonized)
$SPARK_HOME/sbin/start-worker.sh spark://$HOSTNAME:7077 --cores 1 &

# Configure PySpark to launch Jupyter
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

# Start pyspark
pyspark \
  --conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
  --packages org.apache.spark:spark-hadoop-cloud_2.13:3.3.4,com.amazonaws:aws-java-sdk-bundle:1.11.901,org.apache.hadoop:hadoop-aws:3.3.4

