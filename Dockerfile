FROM ubuntu:18.04
COPY ./server/ /tmp/
RUN apt-get update && apt-get install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install pykmip

CMD [ "pykmipep.sh" ]