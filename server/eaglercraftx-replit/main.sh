#!/bin/sh
# 1. Accept EULA
mkdir -p server
echo "eula=true" > server/eula.txt

# 2. Start the Proxy (Tiny RAM)
echo "Starting Bungee Proxy..."
cd bungee
java -Xmx128M -Xms128M -jar bungee.jar & 

# 3. Wait for the Gateway
sleep 20

# 4. Start the Minecraft Server (Low RAM + Optimization)
echo "Starting Minecraft Server..."
cd ../server
# We use -Xmx300M to leave room for the OS and Bungee
java -Xmx300M -Xms300M -jar server.jar nogui
