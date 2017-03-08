#!/bin/sh
set -eu

: ${REGION:?"Run 'docker run brettmcgin/private_internet_access ls' to see the list of regions"}
: ${USERNAME:?"Pass in '-e USERNAME='PIA Username''"}
: ${PASSWORD:?"Pass in '-e PASSWORD='PIA Password''"}

echo "$USERNAME" > auth.conf
echo "$PASSWORD" >> auth.conf

openvpn --auth-user-pass auth.conf