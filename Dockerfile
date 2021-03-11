FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    python-dev \
    libffi-dev \
    libssl-dev \
    libsqlite3-dev \
    python3-pip\
    && rm -rf /var/lib/apt/lists/*
    
RUN pip3 install pykmip && mkdir /etc/pykmip

COPY server.conf /etc/pykmip

CMD [pykmip-server]
