#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Adding users and groups"

groupadd -g 2000 media_tools

useradd -u 2000 -g media_tools plex -s /bin/bash

home_dir="/data"

echo "Creating $home_dir which will hold all of the media server data"
mkdir "$home_dir"


echo "Creating config directories and setting permissions"

configs_dir="$home_dir/configs"
mkdir -p "$configs_dir/plex"
mkdir -p "$configs_dir/sabnzbd"
mkdir -p "$configs_dir/sonarr"
mkdir -p "$configs_dir/radarr"
mkdir -p "$configs_dir/kometa"

chown -R plex:media_tools "$configs_dir/plex"
chown -R sabnzbd:media_tools "$configs_dir/sabnzbd"
chown -R sonarr:media_tools "$configs_dir/sonarr"
chown -R radarr:media_tools "$configs_dir/radarr"
chown -R plex:media_tools "$configs_dir/kometa"

echo "Creating completed media directories"

media_dir="$home_dir/media"
mkdir -p "$media_dir/movies"
mkdir -p "$media_dir/tv"
mkdir -p "$media_dir/music"
mkdir -p "$media_dir/etc"

echo "Creating in-progress directories"

incoming_dir="$home_dir/incoming"
incoming_usenet_dir="$incoming_dir/usenet"
mkdir -p "$incoming_usenet_dir/incomplete"
mkdir -p "$incoming_usenet_dir/complete/movies"
mkdir -p "$incoming_usenet_dir/complete/tv"
mkdir -p "$incoming_usenet_dir/complete/music"
mkdir -p "$incoming_usenet_dir/complete/etc"

echo "Setting permissions on $home_dir"

chown -R root:media_tools "$home_dir"
chmod -R 775 "$home_dir"


