#!/bin/bash
#=============================================================================
#
# FILE: bitwig-fedora.sh
#
# USAGE: bitwig-fedora.sh [-i|-u] [-h]
#
# DESCRIPTION: This script automates the Bitwig Studio installation process on
# Fedora 29.
# The default starting directory is the current directory.
# Do not descend directories on other filesystems.
#
# OPTIONS: See function - usage - below.
# REQUIREMENTS: Fedora 29 Workstation, Bitwig Studio 2.4.3
# NOTES: ---
#=============================================================================

ROOT_UID=0
E_NOTROOT=87
VERSION=2.4.3
DEFAULT_FILENAME="bitwig-studio-$VERSION.deb"
DEFAULT_URL="https://downloads.bitwig.com/stable/$VERSION/$DEFAULT_FILENAME"
INSTALL_LOG="/opt/bitwig-studio/.$DEFAULT_FILENAME.log"
SAFE_FILE_REMOVE="^/\./usr/share/*|^/\./opt/bitwig-studio/*"
OS_VERSION="Fedora release 29 (Twenty Nine)"


#=== FUNCTION ================================================================
# NAME: usage
# DESCRIPTION: Display usage information for this script.
# PARAMETER 1: Install
#=============================================================================
function usage()
{
  printf " usage: $0 <option> \n \n"
  printf " options:\n"
  printf "  -i \t Installs Bitwig Studio\n"
  printf "  -u \t Uninstall Bitwig Studio\n"
  printf "  -h \t Show this menu \n"
}


#=== FUNCTION ================================================================
# NAME: download_bitwig
# DESCRIPTION: Download the correct version of Bitwig Studio for the installation.
#=============================================================================
function download_bitwig()
{
  if [ -f $DEFAULT_FILENAME ] ; then
    echo "Package $DEFAULT_FILENAME already exists."
  else
    echo "Package $DEFAULT_FILENAME does not exist. Initializing the download."
    wget $DEFAULT_URL
  fi
}


#=== FUNCTION ================================================================
# NAME: unpack_bitwig
# DESCRIPTION: Unpack deb package. Copy files to the correct folders.
#=============================================================================
function unpack_bitwig()
{
  echo "Unpacking $DEFAULT_FILENAME . Please Wait."
  tmpfile=$(mktemp)
  dpkg-deb -xv $DEFAULT_FILENAME / | grep -v '[/]$' >> $tmpfile
  mv $tmpfile $INSTALL_LOG
  rm -rf tmpfile
  chown 400 $INSTALL_LOG
}


#=== FUNCTION ================================================================
# NAME: install_dependencies
# DESCRIPTION: Install dependencies for the correct execution of this script.
#=============================================================================
function install_dependencies()
{
  echo "Installing dependencies. Please Wait."
  dnf -y install libbsd bzip2-libs dpkg wget
}


#=== FUNCTION ================================================================
# NAME: create_symbolic_links
# DESCRIPTION: Create symbolic links for library files, to assure the right
# fuction of Bitwig Studio.
#=============================================================================
function create_symbolic_links()
{
  echo "Creating symbolic links."
  ln -s /usr/lib64/libbz2.so.1 /usr/lib64/libbz2.so.1.0
}


#=== FUNCTION ================================================================
# NAME: check_previous_installation
# DESCRIPTION: Check if Bitwig Studio is already installed on system.
#=============================================================================
function check_previous_installation()
{
  if [ -f $INSTALL_LOG ] ; then
    echo "Your system already has Bitwig Studio installed."
    read -p "Are you sure you want to continue? <y/N> " prompt
    if [[ $prompt =~ ^[y]$ ]] ; then
      return 0
    fi
    exit 1
  fi
}


#=== FUNCTION ================================================================
# NAME: install
# DESCRIPTION: Set of fuctions to install Bitwig Studio
#=============================================================================
function install()
{
  check_previous_installation
  install_dependencies
  download_bitwig
  unpack_bitwig
  create_symbolic_links
  echo "Installation Complete."
  echo "You can execute Bitwig Studio from the Applications menu in gnome"
  echo "(Sound and Video section), or running: bitwig-studio in terminal."
}


#=== FUNCTION ================================================================
# NAME: delete_files
# DESCRIPTION: Uninstall Bitwig Studio
#=============================================================================
function delete_files()
{
  echo "Deleting Bitwig Studio."
  while read file; do
    file_to_delete=/$file
    # Validation for safety purposes.
    if [[ -f $file_to_delete && $file_to_delete =~ $SAFE_FILE_REMOVE ]] ; then
      rm -rf $file_to_delete
    fi
  done < $INSTALL_LOG
  rm -rf /opt/bitwig-studio
}


#=== FUNCTION ================================================================
# NAME: uninstall
# DESCRIPTION: Uninstall Bitwig Studio
#=============================================================================
function uninstall()
{
  if [ -f $INSTALL_LOG ] ; then
    read -p "Are you sure you want to uninstall Bitwig Studio? <y/N> " prompt
    if [[ $prompt =~ ^[y]$ ]] ; then
      delete_files
      echo "Bitwig Studio has been deleted."
    fi
  else
    echo "Could not open the install log file => $INSTALL_LOG"
    echo "Are you sure the Bitwig Studio was installed using this script?"
  fi
}


#=== MAIN ====================================================================
if [ "$(cat /etc/fedora-release)" != "$OS_VERSION" ] ; then
  echo "Wrong OS version. Make sure you run the script in - $OS_VERSION -."
  exit 1
fi

if [ "$UID" -ne "$ROOT_UID" ]; then
  echo "You must be root to run this script."
  exit $E_NOTROOT
fi

if [ $# -eq 0 ] ; then
  usage
  exit 1
fi

option=$1

case ${option} in
    "-h")
        usage
        ;;
    "-i")
        install
        ;;
    "-u")
        uninstall
        ;;
    *)
        usage
        exit 1
esac

exit 0
