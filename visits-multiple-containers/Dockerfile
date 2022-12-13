# This line is getting our base docker image
FROM node:14-alpine

# This line creates a directory in the docker container where to project will be stored
WORKDIR '/app'

# This line is coping the package.json into the docker container
COPY package.json . 

# This line is installing all the dependencies from the project
RUN npm install

# This line is coping the rest of the files from this project into the docker container
COPY . .

# This line is starting our app
CMD ["npm", "start"]