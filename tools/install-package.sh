#!/bin/bash -e
apt-get update --quiet
apt-get install --quiet --yes --no-install-recommends curl jq sed vim wget xmlstarlet 
apt-get clean
rm -rf  /var/lib/apt/lists/*
