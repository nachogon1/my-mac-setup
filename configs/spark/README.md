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
`

## Execution
You can get your computer name by doing `scutil --get LocalHostName`. Don't forget to add local at the end.
`
./start-cluster.sh <Your_Computer_Name>.local
`


 
