# Use the official Node.js 18 image based on Alpine Linux as the base image
FROM node:18-alpine

# Set the working directory inside the container to /src
WORKDIR /src

# Copy package.json and package-lock.json (if present) from the local directory to the container's working directory
COPY package*.json ./

# Install Node.js dependencies defined in package.json
RUN npm i

# Copy all the files from the local directory to the container's working directory
COPY . .

# Set environment variables for the application
ENV AMQP_URL="amqp://localhost:5672"
ENV PORT=3000
# Install Bash and download the wait-for-it script from GitHub
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Expose port 3000 to allow incoming connections to the container's application
EXPOSE $PORT

# Set the default command to run when the container starts, which is to execute "node index.js"
CMD ["node", "index.js"]
