# base image 
FROM ubuntu:latest

# Install cowsay package
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay fortune && \
    apt-get install -y  netcat-openbsd

# Set the PATH variable to include the location of cowsay
ENV PATH="/usr/games:${PATH}"

# Copy the script to the container
COPY wisecow.sh /

# Give the script executable permission
RUN chmod +x /wisecow.sh

# Set the working directory to root
WORKDIR /

# Expose the service port
EXPOSE 4499

# Start the script
CMD ["./wisecow.sh"]
