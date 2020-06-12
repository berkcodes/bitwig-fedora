# Bitwig Studio on Fedora
A script that installs the latest version of Bitwig Studio on Fedora.

## Installation
```bash
$ git clone git@github.com:antanasbruzas/bitwig-fedora.git && cd bitwig-fedora

$ chmod +x bitwig-fedora.sh

$ sudo ./bitwig-fedora.sh -i
```

## Uninstallation
To uninstall Bitwig Studio run the **same script version/tag** used in the installation.
Example: if you installed Bitwig Studio with the script version/tag 2.2.2, use the same script version to uninstall it.

```bash
sudo ./bitwig-fedora.sh -u
```
## Bitwig Studio out of date?
If Bitwig Studio is out-of-date, feel free to update the script yourself by editing the `VERSION=` parameter. Alternatively, you can submit a pull-request or a bug report.
