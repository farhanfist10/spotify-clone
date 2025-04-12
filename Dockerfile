# Use an official Nginx image to serve the HTML, CSS, and JS files
FROM nginx:alpine

# Copy the application code to the Nginx server's root directory
COPY . /usr/share/nginx/html

# Expose the port that the app will run on
EXPOSE 80
