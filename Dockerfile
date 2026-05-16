FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      git \
      build-essential \
      python3 \
      python3-pip \
      wget \
      unzip \
      ca-certificates \
      gnupg \
      cgroup-tools \
      libseccomp-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Copy repo contents (your fork)
COPY . /piston

WORKDIR /piston/api

# Install API dependencies
RUN npm install

# Create necessary directories
RUN mkdir -p /piston/packages && \
    mkdir -p /tmp/piston

EXPOSE 2000

CMD ["node", "src/index.js"]
