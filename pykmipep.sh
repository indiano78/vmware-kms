#!/bin/bash

echo "Entry Point for configuring PyKMIP Docker image from https://github.com/OpenKMIP/PyKMIP"

if [ ! -d /etc/pykmip/ ];then
    echo "Creating configuration bucket folder";
    mkdir /etc/pykmip;
fi

if [ ! -f /pykmip/server.conf ];then
    cp /tmp/server.conf /pykmip/server.conf;
fi

if [ -f /pykmip/server.conf ];then
    echo "server.conf file existing, commit it to production";
    cp /pykmip/server.conf /etc/pykmip/server.conf;
fi

if [ ! -d /pykmip/policies ];then
    echo "Creating Policies folder and place default policies";
    mkdir /pykmip/policies;
    cp /tmp/legacy_policy.json /pykmip/policies/;
    cp /tmp/policy.json /pykmip/policies/;
fi

if [ ! -d /pykmip/certs ];then
    echo "Generating self signed Certificate"
    mkdir /pykmip/certs
    subject="/C=FR/ST=Ile de France/L=Paris/O=OpenKMS/OU=PyKMS/CN=$(hostname)"
    echo $subject
    openssl req -x509 -newkey rsa:4096 -keyout /pykmip/certs/key.pem -out /pykmip/certs/cert.pem -days 10365 \
        -nodes \
        -subj "/C=FR/ST=Ile de France/L=Paris/O=OpenKMS/OU=PyKMS/CN=$(hostname)"
fi