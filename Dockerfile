# Use nginx alpine for a lightweight web server
FROM nginx:alpine

# Copy all static files to nginx html directory
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY soldiers.js /usr/share/nginx/html/
COPY Prayer.mp4 /usr/share/nginx/html/
COPY images/ /usr/share/nginx/html/images/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
