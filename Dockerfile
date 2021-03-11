FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    pip \
  && rm -rf /var/lib/apt/lists/* \
  && pip install pykmip
