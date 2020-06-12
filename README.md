# Bitwig Studio on Fedora
A script that installs the latest version of Bitwig Studio on Fedora.

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

