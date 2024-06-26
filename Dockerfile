# Use an official Node runtime as the parent image
FROM node:20.15.0-slim

RUN apt-get update && apt-get install curl -y
RUN apt install openssl -y

# Set the working directory in the container
ENV WORKDIR /usr/src/app
WORKDIR ${WORKDIR}
ADD . ${WORKDIR}

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install
RUN npx prisma generate

EXPOSE ${PORT}

CMD ["npm", "run", "start"]