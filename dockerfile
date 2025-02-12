FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the production version of the app
RUN npm run build

# Install serve to serve the build
RUN npm install -g serve

# Expose port 80
EXPOSE 80

# Serve the app on port 80
CMD ["serve", "-s", "build", "-l", "80"]
