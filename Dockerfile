FROM ubuntu:latest

MAINTAINER Leon Machens leon.machens@gmail.com

# Install dependencies
RUN apt-get update
RUN apt-get install -y curl build-essential python git
RUN apt-get clean

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add user
RUN adduser --disabled-password --gecos '' mup
USER mup

# Install Meteor
ENV METEOR_VERSION 1.4.3.1

RUN curl https://install.meteor.com/?release=${METEOR_VERSION} | sh
ENV PATH="$PATH:/home/mup/.meteor"

# Install mup
RUN meteor npm install mup -g
