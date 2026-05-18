#!/bin/sh
# 1. Accept EULA
mkdir -p server
echo "eula=true" > server/eula.txt

# 2. Start the Proxy and FORCIBLY ignore the download requirement
echo "Starting Bungee Proxy..."
cd bungee
# We add the STFU flag to hide warnings and ensure it uses local resources
java -Xmx256M -Deaglerxbungee.stfu=true -jar bungee.jar & 

# 3. Wait for the Gateway to settle
sleep 30

# 4. Start the Minecraft Server
echo "Starting Minecraft Server..."
cd ../server
java -Xmx512M -jar server.jar nogui
