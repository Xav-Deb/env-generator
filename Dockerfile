############################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Xavier DEBONTE

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip

# Copy the application folder inside the container
RUN git clone https://github.com/Xav-Deb/env-generator.git

# Get pip to download and install requirements:
RUN pip install -r /env-generator/requirements.txt

# Expose ports
EXPOSE 80

# Set the default directory where CMD will execute
WORKDIR /env-generator

# Set the default command to execute
# when creating a new container
# i.e. using CherryPy to serve the application
CMD python server.py
