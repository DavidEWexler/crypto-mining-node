# crypto-mining-node
Turn a Ubuntu Server 16.04 Install Into a Crypto Mining Rig

### Quick Start

**Important** This software is designed for the [Ubuntu Server](https://www.ubuntu.com/download/server) and will mess
up a system with a GUI present. You have been warned!
```
git clone https://github.com/DavidEWexler/crypto-mining-node.git
cd crypto-mining-node
./create-node.sh
```
This will install [Ansible](https://www.ansible.com/) and run the playbooks to install everything you need to start
mining with [Nvidia](https://www.nvidida.com/) based GPUs.

### Part of Auto Mining

This project is the first step in a personal project I'm calling ```Auto Mining``` the goal of which is to automate all parts
of the mining process.  The basic outline of which is:

 1. Automate software install (this)
 2. Automate gpu tuning per card
 3. Automate coin, pool, algo choices
 4. Wrap everything up in [kubernetes](https://kubernetes.io/)
 5. AWS Remote UI for admining GPU Mining as a service
 
You can support this project in a number of ways.

 * [Patreon](https://www.patreon.com/davidewexler)
 * BTC/BCH/BTG: ```1N6VY8smni7kNKUoyV6dgmT1rsZYcXJeU5```
 * ETH: ```0x2c1A963C889D3D0979ee1AD4559A6A45a1461Aa5```
 * XMR: ```4JUdGzvrMFDWrUUwY3toJATSeNwjn54LkCnKBPRzDuhzi5vSepHfUckJNxRL2gjkNrSqtCoRUrEDAgRwsQvVCjZbS1rhs5SkvzFNAEDqAe```
 * ZEC: ```t1Vr9VrkKe5yVbDYKXaivUhUYJzRLgwawfP```
 
### Available To Mine

 - Direct Mining
   - Monero/CryptoNight to the pool of your choice
   - Zcash/Equihash to the pool of your choice
   - Ethereum/Ethash to the pool of your choice
 - Algo Mining Via [NiceHash](https://www.nicehash.com/)
   - CryptoNight
   - DaggerHashimoto/Ethash
   - Equihash
   - Lbry
   - Lyra2REv2
   - NeoScrypt
   - Nist5
   - Skunk
   - X11

### Installed by Cyrpto Mining Node

 - NVidia Drivers and CUDA Library
 - Xorg (required for Nvidia's Overclock utility)
 - Mining Software
   - [ccminer](https://github.com/tpruvot/ccminer.git)
   - [Claymore's Duel ETH Miner](https://github.com/nanopool/Claymore-Dual-Miner/releases)
   - [EWBF's Zcash CUDA miner](https://github.com/nanopool/ewbf-miner/releases/)
   - [xmr-stak](https://github.com/fireice-uk/xmr-stak.git)
 - Systemd Services
   - ```xorg```: for running a headless XServer
   - ```nvidia-power```: for setting GPU power limits
   - ```crypto-miner```: for running the mining software
   - ```crypto-monitor```: for monitoring the miner and restarting in case of errors or configuration changes
   - ```crypto-webui```: [mining-frontail](https://github.com/DavidEWexler/mining-frontail) for web monitoring and configuration changes
 - ```.bashrc``` Additions
   - ```ap```: shortcut for ```ansible-playbook -K```
   - ```watch-miner```: shutcut for ```tail -f /opt/miner/miner-noappend.log```
   - ```restart-miner```: shutcut for ```sudo systemctl restart crypto-miner```

### How hard is it to change settings?

Easy, just visit the web ui that's installed on the port you selected (8443 by default) and edit your settings, including GPU tuning.

i.e. goto ```https://<system.ip>:8443/``` and enter the login credientials you provided at install time.

### I forgot my web password, what can I do?

run the playbook to install the web ui again, from the directory where you cloned this repo.
```
ap ansible/webui-install.yml
```
### How do I name my miner?

Your system's hostname is used as the name of the miner.

### I added a video card and it seems to be hashing slowly

This is because the card is not part of your xorg.conf file yet.  To update the config run the following command from where you cloned
this repo.
```
ap ansible/xorg-restart.yml
```
