#!/bin/bash

#capture CLI arguments (please do not copy comments)
cmd=$1
db_username=$2
db_password=$3

#Start docker
#logical-OR(||)
sudo systemctl status docker || systemctl start docker

#check container status
docker container inspect jrvs-psql
container_status=$?

#process the arguments
case $cmd in 
  create)

# Ensure there are three arguemnts
 if [ $# -ne 3 ]; then
   echo 'additional username or password is required'
   exit 1
 fi
#Get the image
docker pull postgres:9-alpine

#Create container
docker volume create pgdata

# Check if the container is already created
  if [ $container_status -eq 0 ]; then
		echo 'Container already exists'
		exit 1	
	fi

#check if CLI has valid arguments, else exit with error
  if [ $# -ne 3 ]; then
    echo 'Create requires username and password'
    exit 1
  fi

#create a container using psql image with name=jrvs-psq
docker run --name jrvs-psql -e POSTGRES_PASSWORD="${db_password}" -e POSTGRES_USER="${db_username}" -d -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres:9.6-alpine
	exit $?
	;;

  start|stop) 
  #check instance status; exit 1 if container has not been created
  if [ $container_status -eq 1 ]; then
        echo 'container is not created'
        exit 1
    fi

  #Start or stop the container
	docker container $cmd jrvs-psql
	exit $?
	;;	
  
  *)
	echo 'Illegal command'
	echo 'Commands: start|stop|create'
	exit 1
	;;
esac
