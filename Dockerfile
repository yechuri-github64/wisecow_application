FROM ubuntu:20.04

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install runtime dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fortune-mod \
    fortunes \
    cowsay \
    netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user and group
RUN addgroup --system appgroup && adduser --system --no-create-home --ingroup appgroup appuser

# Create working directory and set ownership
WORKDIR /app
RUN chown appuser:appgroup /app

# Copy the script
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

# Use non-root user
USER appuser

# Set PATH to include cowsay and fortune
ENV PATH="/usr/games:/app:${PATH}"

# Expose the service port
EXPOSE 4499

# Start the script
CMD ["/app/wisecow.sh"]
