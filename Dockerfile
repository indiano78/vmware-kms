FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    python-dev \
    libffi-dev \
    libssl-dev \
    libsqlite3-dev \
    python3-pip\
    && rm -rf /var/lib/apt/lists/*
    
RUN pip3 install pykmip \
    && mkdir /etc/pykmip \
    && mkdir /etc/pykmip/policies\
    && mkdir /etc/pykmip/certs

COPY server.conf /etc/pykmip
COPY legacy_policy.json /etc/pykmip/policies/
COPY policy.json /etc/pykmip/policies/
