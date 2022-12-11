FROM node:14-alpine

# Files in the simple-node-app project are not included in the image and need to be copied into the container before the npm install so that all the dependencies are downloaded based on the package.json. That is what this copy command is doing
COPY ./ ./
RUN npm install


CMD ["npm", "start"]