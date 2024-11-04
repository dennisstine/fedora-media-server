#!/bin/bash

sudo firewall-cmd --list-all

sudo firewall-cmd --zone=FedoraServer --permanent --add-service=http
sudo firewall-cmd --zone=FedoraServer --permanent --add-service=https

# docker tcp
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 2375/tcp

# plex ui port - others can be opened as well
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 32400/tcp

# sabnzbd
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 8080/tcp
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 9090/tcp

# sonarr
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 8989/tcp

# radarr
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 7878/tcp

# lidarr
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 8686/tcp

# kometa
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 7676/tcp

# dex
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 9292/tcp

# grafana
sudo firewall-cmd --zone=FedoraServer --permanent --add-port 3000/tcp

sudo firewall-cmd --reload

sudo firewall-cmd --list-all
