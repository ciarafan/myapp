# Use a Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install Git and required dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git perl && \
    rm -rf /var/lib/apt/lists/*

# Copy the project files into the container
COPY . /app

# Make the entrypoint script executable
RUN chmod +x /app/.github/scripts/entrypoint.sh

# Run the entrypoint script when the container starts
ENTRYPOINT ["/app/.github/scripts/entrypoint.sh"]
