Docker Notes:

Commands:
docker ps = List running processes
docker ps --all = List all the containers that have ever been created
docker run <name of image> ls = List all files within the image
docker build -t <name of the filename you want to give it> . # <= The dot at the end says to run this build in the current dir Note: make sure you are in the correct dir before you run this command

Creating and run a new container with existing image (One command)
# In terminal run => docker run <name of image> = This will create a new container

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