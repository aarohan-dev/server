#!/bin/sh

# 1. Accept EULA
mkdir -p server
echo "eula=true" > server/eula.txt

# 2. Grant permissions
chmod +x bungee/bungee.jar
chmod +x server/server.jar

# 3. Start the Bungee Proxy with SQLite driver attached
# We use -cp to include the sqlite jar so it doesn't try to download it
echo "Starting Bungee Proxy..."
cd bungee
java -Xmx256M -cp "bungee.jar:sqlite-jdbc-3.45.0.0.jar" net.md_5.bungee.Bootstrap & 

# 4. Give bungee more time to initialize (Render can be slow)
sleep 45

# 5. Start the Minecraft Server
echo "Starting Minecraft Server..."
cd ../server
java -Xmx512M -jar server.jar nogu
