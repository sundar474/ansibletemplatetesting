# Use the official Ubuntu base image
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y git nginx

# Clone the Git repo
RUN cd /tmp && git clone https://github.com/sundar474/ansibletemplatetesting.git

# Copy index file to Nginx HTML folder
COPY /tmp/ansibletemplatetesting/index.nginx-debian.html /var/www/html/index.nginx-debian.html

# Copy style files to Nginx HTML folder
COPY /tmp/ansibletemplatetesting/style.css /var/www/html/style.css

# Copy javascript files to Nginx HTML folder
COPY /tmp/ansibletemplatetesting/scorekeeper.js /var/www/html/scorekeeper.js

# Restart Nginx
CMD service nginx restart
