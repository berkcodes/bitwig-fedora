# Bitwig Studio on Fedora
A script that installs the latest version of Bitwig Studio on Fedora. Now you don't need to update the script, it will automatically scrape bitwig.com/download and get the latest version. To update, simply re-run the script.

# Update
Bitwig Studio is now available as a Flatpak so support for this script has stopped. I would highly recommend trying the Flatpak out as you don't need to mess with installing extra dependencies to get the .deb version working on a RPM system (i.e. Fedora).

#### Disclaimer
This script is a bit messy so use at your own risk. Until the Flatpak version comes around, you can use this install and update Bitwig. There may be some issues with the script as the Bitwig Studio site does change, if you encounter any issues, please open an issue.

## Installation / Updating (one-liner)
To install Bitwig on Fedora, simply copy paste the command below.
```bash
cd /tmp && wget https://raw.githubusercontent.com/berkiyo/bitwig-fedora/master/install.sh && chmod 777 install.sh && ./install.sh
```


## Manual Installation
```bash
git clone https://github.com/berkiyo/bitwig-fedora.git && cd bitwig-fedora

chmod +x bitwig-fedora.sh

sudo ./bitwig-fedora.sh -i
```

## Uninstallation
To uninstall Bitwig Studio run the **same script version/tag** used in the installation.
Example: if you installed Bitwig Studio with the script version/tag 2.2.2, use the same script version to uninstall it.

```bash
sudo ./bitwig-fedora.sh -u
```
## Bitwig Studio out of date?
If Bitwig Studio is out-of-date, feel free to update the script yourself by editing the `VERSION=` parameter. Alternatively, you can submit a pull-request or a bug report.
