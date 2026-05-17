#!/bin/sh

# 1. Create folders so downloads have a place to land
mkdir -p bungee
mkdir -p server

# 2. Download Bungee (The Proxy)
# Using a direct raw link to ensure it's not a corrupted HTML file
if [ ! -f "bungee/bungee.jar" ]; then
  echo "Downloading Bungee Proxy..."
  curl -L -o bungee/bungee.jar https://github.com/Eaglercraft-Archive/Eaglercraftx-1.8.8-src/raw/main/gateway/EaglercraftXBungee/EaglerXBungee-Latest.jar
fi

# 3. Download Server (The Game)
if [ ! -f "server/server.jar" ]; then
  echo "Downloading Minecraft Server..."
  # Using a standard Spigot 1.8.8 link
  curl -L -o server/server.jar https://cdn.getbukkit.org/spigot/spigot-1.8.8-R0.1-SNAPSHOT-latest.jar
fi

# 4. Accept EULA
echo "eula=true" > server/eula.txt

# 5. RUN THE SERVER
echo "Starting Bungee Proxy..."
cd bungee
# We use -Xmx256M to give the proxy enough room to handle connections
java -Xmx256M -jar bungee.jar & 

sleep 5

echo "Starting Minecraft Server..."
cd ../server
# We use the remaining RAM for the main server
java -Xmx512M -jar server.jar nogui
