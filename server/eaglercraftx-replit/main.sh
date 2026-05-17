#!/bin/sh

# 1. Create folders first so the downloads have a place to go
mkdir -p bungee
mkdir -p server
mkdir -p web

# 2. Download Bungee (The Proxy) if missing
if [ ! -f "bungee/bungee.jar" ]; then
  echo "Downloading Bungee Proxy..."
  curl -L -o bungee/bungee.jar https://github.com/YueSheng03/EaglercraftX-1.8/raw/main/BungeeCord/BungeeCord.jar
fi

# 3. Download Server (The Game) if missing
if [ ! -f "server/server.jar" ]; then
  echo "Downloading Minecraft Server..."
  curl -L -o server/server.jar https://github.com/YueSheng03/EaglercraftX-1.8/raw/main/spigot-1.8.8.jar
fi

# 4. Accept EULA
echo "eula=true" > server/eula.txt

# 5. RUN THE SERVER
echo "Starting Bungee Proxy..."
cd bungee
java -Xmx128M -jar bungee.jar & 

# Wait a second for Bungee to warm up
sleep 2

echo "Starting Minecraft Server..."
cd ../server
java -Xmx512M -jar server.jar nogui
