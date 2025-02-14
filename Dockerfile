# Use Node.js official image as base
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy rest of the application
COPY . .

# Expose port 3000 for Node.js
EXPOSE 3000

# Start the Node.js server
CMD ["node", "server.js"]

