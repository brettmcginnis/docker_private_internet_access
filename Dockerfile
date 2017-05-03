FROM ubuntu:16.04

MAINTAINER Brett McGinnis <brettmcgin@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    openvpn \
    wget \
    unzip

ARG VPN_DIR=/etc/openvpn

RUN mkdir -p ${VPN_DIR} && \
    cd ${VPN_DIR}

WORKDIR ${VPN_DIR}

#https://www.privateinternetaccess.com/openvpn/openvpn.zip
#https://www.privateinternetaccess.com/openvpn/openvpn-ip.zip
#https://www.privateinternetaccess.com/openvpn/openvpn-ip-lport.zip
#https://www.privateinternetaccess.com/openvpn/openvpn-tcp.zip
#https://www.privateinternetaccess.com/openvpn/openvpn-ip-tcp.zip

RUN wget https://www.privateinternetaccess.com/openvpn/openvpn-ip.zip && \
    unzip openvpn.zip

COPY openvpn.sh openvpn.sh

ENV REGION='US West'
ENV USERNAME=''
ENV PASSWORD=''

CMD sh openvpn.sh