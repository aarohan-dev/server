#!/bin/sh

# 1. Accept EULA
echo "eula=true" > server/eula.txt

# 2. Grant permissions (Crucial for Render)
chmod +x bungee/bungee.jar
chmod +x server/server.jar

# 3. Start the Proxy
echo "Starting Bungee Proxy..."
cd bungee
java -Xmx256M -jar bungee.jar & 

# Give bungee a moment to start
sleep 5

# 4. Start the Minecraft Server
echo "Starting Minecraft Server..."
cd ../server
java -Xmx512M -jar server.jar nogui
