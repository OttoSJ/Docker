FROM node:14-alpine

# The WORKDIR creates a directory that will store all directories and files for the simple node app
WORKDIR /usr/app

# Coping the package.json file here keep from installing npm unless there have been dependencies add to the project
COPY ./package.json ./

RUN npm install

# Files in the simple-node-app project are not included in the image and need to be copied into the container before the npm install so that all the dependencies are downloaded based on the package.json. That is what this copy command is doing
COPY ./ ./


CMD ["npm", "start"]