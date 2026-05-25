#!/bin/bash

# Clear any stuck processes
unset DISPLAY

# 1. Accept EULA
echo "eula=true" > /home/aarohankarki/server/eaglercraftx-replit/server/eula.txt

# 2. Define the exact locations
JAVA_BIN="/home/aarohankarki/server/eaglercraftx-replit/jdk-17.0.11+9-jre/bin/java"
BUNGEE_DIR="/home/aarohankarki/server/eaglercraftx-replit/bungee/bungee"
SERVER_DIR="/home/aarohankarki/server/eaglercraftx-replit/server"

echo "Starting Bungee Proxy..."
cd "$BUNGEE_DIR"
"$JAVA_BIN" -Xmx256M -jar bungee.jar & 

# Give Bungee a 5-second head start
sleep 5

echo "Starting Minecraft Server..."
cd "$SERVER_DIR"
"$JAVA_BIN" -Xmx2G -jar server.jar nogui
