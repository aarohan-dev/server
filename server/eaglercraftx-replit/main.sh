#!/bin/sh

# Clear any stuck processes
unset DISPLAY

# 1. Accept EULA automatically
echo "eula=true" > server/eula.txt
echo "eula=$REPL_OWNER/$REPL_SLUG" > eula.txt

# 2. Ensure directories exist
mkdir -p bungee/plugins
mkdir -p server/plugins
mkdir -p web

# 3. Skip the Git/Compile loop (This is what was crashing)
# We assume the files are already there from the import.
echo "Skipping git update to bypass Replit security..."

# 4. RUN THE SERVER
# We are running the Bungee Proxy and the Server at the same time.
# On Replit Free, we use less RAM to prevent crashing.

echo "Starting Bungee Proxy..."
cd bungee
java -Xmx128M -jar bungee.jar & 

echo "Starting Minecraft Server..."
cd ../server
java -Xmx512M -jar server.jar nogui 
