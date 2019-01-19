# Bitwig Studio on Fedora

Automatization of Bitwig Studio installation process on Fedora.
I forked this because it hasn't been updated for the latest version of Bitwig or supported the latest version of Fedora.

## Install procedure

```bash
$ git clone https://github.com/nunodio/bitwig-fedora.git

$ cd bitwig-fedora

$ chmod +x bitwig-fedora.sh

$ sudo ./bitwig-fedora.sh -i
```

## Uninstall procedure

This procedure is only available if you installed Bitwig Studio with this script.

To uninstall Bitwig Studio run the **same script version/tag** used in the installation.
Example: if you installed Bitwig Studio with the script version/tag 2.2.2, use the same script version to uninstall it.

```bash
sudo ./bitwig-fedora.sh -u
```
