#!/bin/bash

OCSP_SERVER="http://192.168.1.76:8081"
CERT=$1
CA_CERT="ca.crt"

if [ ! -f "$CA_CERT" ]; then
    echo "ERROR: CA certificate not found at $CA_CERT"
    exit 1
fi


openssl ocsp -issuer "$CA_CERT" -serial "$CERT" -url "$OCSP_SERVER" -noverify
