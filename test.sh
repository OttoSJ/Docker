Docker Notes:

Commands:
docker ps = List running processes
docker ps --all = List all the containers that have ever been created
docker run <name of image> ls = List all files within the image

Creating a new docker image and a container (One command)
# In terminal run => docker run <name of image> = This will start a new instance of a docker image

Creating a new docker container (Only creates container not image)
# In terminal run => docker create <name of image>

Starting a docker container
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
# In terminal run => docker exec -it <container id> sh (You should get a prompt like this => #)

Starting a container and opening the command (cli) line all at once
Note: It is more likely that you will use the first one since you cannot start any other processes for that container.
# In terminal run => docker run -it <name of image> sh