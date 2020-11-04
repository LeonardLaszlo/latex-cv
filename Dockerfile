# docker image build -t laslaul/cv-latex:latest .
# CONTAINER_ID=$( docker run --detach --tty laslaul/cv-latex:latest )
# docker cp cv.tex "$CONTAINER_ID":/usr/docker/ && docker exec --interactive --tty "$CONTAINER_ID" make xelatex && docker cp "$CONTAINER_ID":/usr/docker/cv.pdf .
# docker stop "$CONTAINER_ID" && docker rm "$CONTAINER_ID"

# Use the official image as a parent image.
FROM ubuntu:20.04

# Set the working directory.
WORKDIR /usr/docker

# Copy the files from your host to your current location.
COPY fonts/ ./fonts
COPY images/ ./images
COPY *.tex *.sty *.cls Makefile ./

# Run the command inside your image filesystem.
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  bash-completion=1:2.10-1ubuntu1 \
  make=4.2.1-1.2 \
  tzdata=2020d-0ubuntu0.20.04 \
  nano=4.8-1ubuntu1 \
  && echo "Europe/Zurich" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata \
  && apt-get -y install --no-install-recommends texlive-xetex=2019.20200218-1 texlive-fonts-recommended=2019.20200218-1 \
  && rm -rf /var/lib/apt/lists/*
