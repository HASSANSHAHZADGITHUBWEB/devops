# Use a lightweight Node.js image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files and install dependencies first (for faster builds)
COPY package.json .
RUN npm install

# Copy the rest of your code
COPY . .

# Command to start the app
CMD ["npm", "run", "dev"]
