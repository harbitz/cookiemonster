# Start with a minimal Go image
FROM golang:1.20-alpine

# Set the working directory inside the container
WORKDIR /app

# Install git, ca-certificates, and build-essential (optional)
RUN apk add --no-cache git ca-certificates

# Copy the local repository into the container
COPY . .

# Install the cookiemonster tool from the local repository
RUN go install ./cmd/cookiemonster

# Expose the port (if the application requires a specific port, otherwise skip this)
# EXPOSE 8080

# Set the entrypoint to the installed tool
ENTRYPOINT ["/go/bin/cookiemonster"]

# If you need to pass arguments, you can specify CMD, e.g.
# CMD ["--help"]
