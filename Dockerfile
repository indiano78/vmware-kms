FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    python-dev \
    libffi-dev \
    libssl-dev \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/pykmip

COPY server.conf /etc/pykmip

CMD [pykmip-server]
