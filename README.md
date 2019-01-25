# wallaby-wifi-clientor
Changes the KIPR Wallaby robotics platform from being a wifi hotspot into being a wifi client, able to connect to standard wifi networks.

# Caveats and Warnings
This script may break everything you love. We are not liable in that case. This script may be everything you've ever wanted. We're not liable for that either. No liabilities. That's the game.

# Irreversable (No More Hotspot)
This script backs up your files so you *could* restore everything in theory. However the script is currently only unidirectional. It will convert your Wallaby from being a wifi hotspot into a wifi client. If you want to revert, it may be easiest to re-image the Wallaby for now.

# Use and Installation Instructions
Download and place the entire folder containing the wallaby_update.sh script onto a usb thumbdrive. Plug the thumbdrive into the USB port on the Wallaby and go into the standard Wallaby updates menu. Click "update" to run the script.

# Helpful Next Steps
Assign it a hostname so that you can connect to your Wallaby, regardless of what IP address it picks up. Fire up a terminal (download and use PuTTY if you're on Windows) and ssh to the IP address listed in the Wallaby network section of the GUI.
type:

echo myWallabyHostname > /etc/hostname
hostname myWallabyHostname

Restart your Wallaby. Now you can connect to your Wallaby using the hostname instead of the IP address.

