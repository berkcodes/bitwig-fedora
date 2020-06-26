#!/bin/sh

printf "\n\n\n///         Bitwig Fedora Installer!         ///\n\n\n"
cd /tmp && git clone https://github.com/berkiyo/bitwig-fedora.git && cd bitwig-fedora && chmod +x bitwig-fedora.sh && sudo ./bitwig-fedora.sh -i
