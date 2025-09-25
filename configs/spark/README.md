## Requeriments
MacOS (Developed in Sequoia)
python3.13
java11
[Python requirements]
pyspark==3.5.5
notebook==7.4.0
ipykernel==6.29.5
[Spark Dependencies]
spark-3.5.5-bin-hadoop3 (https://spark.apache.org/downloads.html)



## Installation
Set your python and java environment, download spark binaries spark-3.5.5-bin-hadoop3 and set the unzipped folder as SPARK_HOME variable. Finally, grant executable permissions to the launching scripts.
`
chmod a+x start-cluster.sh stop-cluster.sh

To add avro and s3 connectors in pyspark4.0.0 we need  
`cd $SPARK_HOME`
`curl -O https://repo1.maven.org/maven2/software/amazon/awssdk/bundle/2.25.66/bundle-2.25.66.jar`

You might need to change the entry point in start-cluster
```
# Start pyspark
pyspark \
  --jars $SPARK_HOME/jars/hadoop-aws-3.4.1.jar,$SPARK_HOME/jars/bundle-2.25.66.jar \
  --conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem
```

## Execution
You can get your computer name by doing `scutil --get LocalHostName`. Don't forget to add local at the end.
`
./start-cluster.sh <Your_Computer_Name>.local
`


 
