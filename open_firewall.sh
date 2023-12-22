#!/bin/bash

sudo firewall-cmd --list-all

sudo firewall-cmd --zone=public --permanent --add-service=http
sudo firewall-cmd --zone=public --permanent --add-service=https

# docker tcp
sudo firewall-cmd --zone=public --permanent --add-port 2375/tcp

# plex ui port - others can be opened as well
sudo firewall-cmd --zone=public --permanent --add-port 32400/tcp

# sabnzbd
sudo firewall-cmd --zone=public --permanent --add-port 8080/tcp
sudo firewall-cmd --zone=public --permanent --add-port 9090/tcp

# sonarr
sudo firewall-cmd --zone=public --permanent --add-port 8989/tcp

# radarr
sudo firewall-cmd --zone=public --permanent --add-port 7878/tcp

# tautulli
sudo firewall-cmd --zone=public --permanent --add-port 8181/tcp

# cadvisor
sudo firewall-cmd --zone=public --permanent --add-port 8282/tcp


sudo firewall-cmd --reload

sudo firewall-cmd --list-all
