# Introduction
In this Linux-SQL project, the Jarvis Linux Cluster Administration (LCA) want to record the hardware specification of 10 servers running CentOS7 which are connected to each other throughout a switch. The data are recorded in real-time each minute in an RDBMS. In this way, the Jarvis Linux Cluster Administration (LCA) can manage the resource usage of each node and make it optimize and efficient in future.
The technologies that are used in this project are:
-	bash scripts (used to gather the hardware specifications, resource usage, and manage docker)
-	Postgres database (stores the collected data)
-	Psql (Postgres client program used to administer the Postgres database)
-	Git (version control software)
-	Jarvis Remote Desktop (JRD) (development and testing environment running CentOS 7)
-	Google Cloud Platform (GCP) provided the instance to run the JRD.
-	Docker (container running the Postgres database)
-	IntelliJ IDEA (IDE to edit files)
## Quick Start
- Create the Postgres container:
``` bash 
psql_docker.sh create psql_username psql_password
```
- Start the Postgres container:
```bash
psql_docker.sh start
```
- Stop the Postgres container:
```bash
psql_docker.sh stop
```
- Create the Postgres schema:
```bash
psql -h localhost -U postgres -d host_agent -f ddl.sql
```  
- Insert the hardware specifications data into the database:
```bash
host_info.sh psql_host psql_port db_name psql_user psql_password
```
- Insert the server usage data into the database:
```bash
host_info.sh psql_host psql_port psql_name psql_user psql_password
```
- Configure the Linux server's CRON program to execute the script:
#### Edit crontab file
```bash
crontab -e
```

#### Add following line to the file
```bash
* * * * * bash <your path>/host_usage.sh psql_host psql_port db_name psql_user psql_password > /tmp/host_usage.log
```
# Implementation
In this part, architecture, database modeling and scripts are described.
## Architecture
The architecture of the project is shown in the following diagram.

![Diagram](https://user-images.githubusercontent.com/71785631/146416813-f13726ad-d266-4edb-8b8a-621fdef31040.png)

## Scripts
In this part, some scripts which are used in project are mentioned.
### Psql_docker.sh
This command create the docker container to run the Postgres database.
```bash
psql_docker.sh create psql_username psql_password
```
The following command start the Docker.
```bash
psql_docker.sh start
```
The following command stop the Docker.
```bash
psql_docker.sh stop
```

### host_info.sh
The following script, collect the memory and CPU information of host and send it to Postgres database. This command should be executed before host_usage.sh and just for one time.

### Usage
By the following command we can insert hardware specifications to the Postgres database.
```bash
host_info.sh psql_host psql_port db_name psql_user psql_password
```

The psql_host is the Postgres host which runs the database, psql_port is the port that Postgres server is listening to it,db_name is the database name which is host_agent, psql_user and psql_password are username and password when we want to create the database.

### Host_usage.sh
In this part, the memory and CPU information and disk usage of host are recorded every minute.

### Usage
By following command, we can insert the usage information of node to Postgres database.
```bash
host_info.sh psql_host psql_port psql_name psql_user psql_password
```
The psql_host is the Postgres host which runs the database, psql_port is the port that Postgres server is listening to it,db_name is the database name which is host_agent, psql_user and psql_password are username and password when we want to create the database.

### Crontab
The Cron is used to monitor the host usage information every minute.

### Usage
The following steps are used to configure the Linux server's CRON program to execute the script. The Cron file should be created to call the script every minute.
### Edit crontab file
```bash
crontab -e
```
### Cron file
```bash
* * * * * bash <your path>/host_usage.sh psql_host psql_port db_name psql_user psql_password > /tmp/host_usage.log
```
## Queries.sql
In this part, sample SQL queries are used to monitor the data. First Query shows all the servers with their total memories and number of CPUs. The second query, shows the average used memmory for each server whithin 5 minutes interval. The last Query detects the server failure if within 5 minutes interval, it inserts less than three data points.
```bash
  psql -h localhost -U postgres -d host_agent -f queries.sql  
```
## Database modeling
The Host agent database contains host_info and host_usage tables.
### Host_info
The host_info table contains following hardware information of each Linux node.
|Column|Type|Description|
| :---: | :---: | :---: |
|id	|SERIAL	|This column is the primary key|
| hostname | VARCHAR | The name of the Linux server and Unique |
| cpu_number | INTEGER | The number of CPUs in the node |
| cpu_architecture | VARCHAR | The architecture of CPU in the node |
| cpu_model | VARCHAR | The CPU model in the server |
| cpu_mhz | REAL | The CPU clock speed in the server |
| L2_cache | INTEGER | The L2 cache size of the CPU in the node |
| total_mem | INTEGER | The total memory in the server |
| timestamp | TIMESTAMP | Timestamp records when data is added to the database |

### host_usage
The table stores the host usage information of each node. The host_usage table contains following usage information of each server. 
| Column | Type |	Description |
| :---: | :---: | :---: |
| timestamp | TIMESTAMP |	Timestamp records when data is added to the database |
| host_id |	INTEGER |	This is the foreign key of the id from the host_info table. It shows the node id where the data comes, from the host_info table|
| memory_free |	INTEGER |	The amount of memory free |
| cpu_idle |	INTEGER	| The amount of the idle CPU |
| cpu_kernel |	INTEGER |	The percentage of CPU usage of the kernel |
| disk_io	| INTEGER	| The amount of disk I/O |
| disk_available |	INTEGER	| The free disk space |


## Test
Jarvis remote desktop is running on Google Cloud Platform which is running CentOs7. The testing and developing of bash script were done on Jarvis Remote desktop. This server has a docker running Postgres database. By the scripts we can send the information to database.
## Deployment
All scripts were deployed from the Jarvis Remote Desktop to a GitHub repository. The Postgres docker was created and used as the database.
## Improvements
Improvements for this project can be:
- The project need a mechanism to update the data.
- Using a GUI can make it much more user friendly.
- If the data is not added to database, the system does not show any error. If the database is down or we cannot insert information in database, a system should save it in local server.


