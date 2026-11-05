# Use a Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Install necessary dependencies, including Git
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Copy the project files into the container
COPY . /app

# Ensure the entrypoint script is executable
RUN chmod +x /app/.github/scripts/entrypoint.sh

# Run the entrypoint script when the container starts
ENTRYPOINT ["/app/.github/scripts/entrypoint.sh"]
