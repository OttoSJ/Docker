Docker Notes:

******************************************************************************************
Commands:
docker ps = List running containers
docker ps --all = List all the containers that have ever been created
docker run <name of image> ls = List all files within the image
docker build -t <name of the filename you want to give it> . # <= The dot at the end says to run this build in the current dir Note: make sure you are in the correct dir before you run this command
docker-compose ps = list running containers # This command needs to be ran in the root so that it can access the docker-compose.yml file.
******************************************************************************************

Creating and run a new container with existing image (One command)
# In terminal run => docker run <name of image or id> = This will create a new container

Starting a docker container with an existing image
Note: The -a command lets docker know to watch the container for output and print that output 
# In terminal run => docker start -a <container id from the step above>

Stopping a docker container
Note: The stop command lets the container run some clean up functions before it shuts down.
# In terminal run => docker stop <container id>

Note: The kill command shuts down the container immeadiatly
# In terminal run => docker kill <container id>

Executing commands inside a Container:
Note: You can only execute commands on a container inside of that container.
# In terminal run => docker ps (make sure the container is still runnig and get the container id)
# In terminal run => docker exec -it <container id> <command you want to run> 

example: docker exec -it 3223e86b7c38 redis-cli
Note: The -it flag allows you to write the command you want to exec

Starting a command line (cli) inside a docker container
Note: This method allows you to run other proceses will also using the command line (Preferred!!!). 
# In terminal run => docker run -it <container id> sh (You should get a prompt like this => #)

Starting a container and opening the command (cli) line all at once
Note: It is more likely that you will use the first one since you cannot start any other processes for that container.
# In terminal run => docker run exec -it <name of image> sh

Building and Tagging a docker image 
Note: The tag is the "latest" at the end and the project name is what comes before the tag.
# In terminal run => docker build -t <whatever you want to name this image>:latest .

example: docker build -t ottojones/redis:latest . <= dont forget the dot at the end
Note: Now you can run the new image with tag leaving off the :latest example: docker run ottojones/redis

Port Mapping 
Note: This will allow incomming req for this container
# In terminal run => docker run -p 5000:5000 <name of container>

USING DOCKER COMPOSE (Automates command line commands and to connect multiple containers)
See docker-compose.yml file for reference

- The dash inside of a yml file denotes an array

Connecting two docker containers = Once you place both containers inside the services block within the yml file, docker compose will create both of these files on the same network which will allows them to communicate between each other.

Starting a container with docker compose
# In terminal run => docker-compose up -d
Note: This command looks inside the docker-compose.yml file and runs whats in the services block

Building an image and starting a new container (One command)
# In terminal run => docker-compose up --build
Note: This command looks inside the docker-compose.yml file, builds an image and starts a new container based on whats in the services block

Stopping Docker Compose containers
# In terminal run => docker-compose down

Restarting container after crash
Note: This code is placed inside of docker-compose.yml file

restart can take any of the following arguments: "no" <= default, always, on-failure, unless-stopped

Example: 
version: "3"
services:
  redis-server:
    image: "redis" # <== This is already in the local docker hub
  node-app:
    restart: on-failure # <== restart
    build: . # <== This is being built from the Dockerfile inside this app
    ports:
      - "5000:5000"

restart definitions:
"no" = Never attempt to resart this container if it stops or crashes
always = It this container stops for any reason always attemt to restart it
on-failure = Only restart if the container stops with an error code
unless-stopped = Always restart unless the developer forcibly stops it