#!/bin/bash

clear
echo ""
echo " 
 ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄       ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄ 
▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌     ▐░▌       ▐░▌▐░░░░░░░░░░░▌
 ▀▀▀▀█░█▀▀▀▀ ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀      ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀ 
     ▐░▌     ▐░▌       ▐░▌▐░▌               ▐░▌       ▐░▌▐░▌          
     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄      ▐░▌       ▐░▌▐░▌ ▄▄▄▄▄▄▄▄ 
     ▐░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌       ▐░▌▐░▌▐░░░░░░░░▌
     ▐░▌     ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀      ▐░▌       ▐░▌▐░▌ ▀▀▀▀▀▀█░▌
     ▐░▌     ▐░▌       ▐░▌▐░▌               ▐░▌       ▐░▌▐░▌       ▐░▌
     ▐░▌     ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄      ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌
     ▐░▌     ▐░▌       ▐░▌▐░░░░░░░░░░░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
      ▀       ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀       ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀ 
                                                                      
  "
echo ""
echo "🚀 Kuzco Node Installer by theUG is starting..."
sleep 1

# Step 1: Install dependencies
echo ""
echo "🔧 Installing required packages..."
apt update && apt install curl iptables build-essential git wget lz4 jq make cmake gcc nano automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev screen ufw -y || {
    echo "❌ Package installation failed"; exit 1;
}

# Step 2: Install Kuzco CLI
echo ""
echo "📥 Installing Kuzco CLI from Inference Network..."
curl -fsSL https://devnet.inference.net/install.sh | sh || {
    echo "❌ Failed to install Kuzco CLI"; exit 1;
}

# Step 3: Start a screen session named "kuzco"
echo ""
echo "🖥️ Creating screen session: kuzco"
if command -v screen &>/dev/null; then
    screen -dmS kuzco bash -c 'inference node start --code a51f1fa7-4a92-4c7d-9f5b-cdceda8d7891; exec bash'
    echo "✅ Kuzco node started inside screen session 'kuzco'"
else
    echo "❌ screen is not installed or working"
    exit 1
fi

# Step 4: Done!
echo ""
echo "🎉 All done! Your Kuzco node is now running."
echo "👉 To view logs, use: screen -r kuzco"
echo ""
