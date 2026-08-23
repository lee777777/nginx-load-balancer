#this is a step-by-step recipe Docker uses to build a reusable image for the Node.js application.
# Base image: Lightweight Alpine Linux pre-configured with Node.js
FROM node:alpine3.23 
# Sets the working directory inside the container
WORKDIR /app
# Copy application files and package configurations
COPY server.js .
COPY index.html .
COPY images ./images
COPY package.json .
# Install dependencies defined in package.json
RUN npm install
# Document that the app listens on port 3000 inside the container network
EXPOSE 3000
# Start the application
CMD ["node", "server.js"]
