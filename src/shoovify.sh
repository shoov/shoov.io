#!/usr/bin/env bash

init_behat () {
  # Move behat folder to root.
  mv $TEMP_DIR/behat ./
  # Create a behat local config.
  cp ./behat/behat.local.yml.example ./behat/behat.local.yml
  # Add behat folder to git.
  git add behat
}

YELLOW='\033[33m'
RED='\033[31m'
END='\033[0m'

echo
echo "${YELLOW}Start shoovly repository${END}"
echo

# Test that git repository exist.
if [ ! -d .git ]; then
  echo "${RED}Script should be running in exist git repository.${END}"
  exit 1
fi

# Name of temporary directory.
TEMP_DIR='.shoov-temp'

# Clone another repository with example shoov.yml and behat tests.
git clone https://github.com/amitaibu/gizra-behat $TEMP_DIR

# Move .shoov.yml to root of repository.
cp $TEMP_DIR/.shoov.yml ./

# Add .shoov.yml to git.
git add .shoov.yml

# Unpack behat enviroment.
tar zxf $TEMP_DIR/behat/behat-vendor.tar.gz -C $TEMP_DIR/behat

# Move behat enviroment with tests to root directory.
# First test that behat folder doesn't exist.
if [ -d behat ]; then
  echo
  echo "${RED}Behat directory already exist. If you want to install behat "
  echo "examples please remove behat folder and rerun this script.${END}"
  echo
else
  # Run initilisation of behat folder.
  init_behat
fi

# Remove temporary folder.
rm -rf $TEMP_DIR

# show git status
git status

# commit
git commit -am 'Shoovify complete!'

echo
echo "${YELLOW}Shoov is configured. Now you need to make push and after";
echo "you can activate your repository on the shoov.io${END}";
echo
echo "Also you can run tests by next command: cd behat && bin/behat"
echo

exit 0
