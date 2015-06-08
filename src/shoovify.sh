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

echo "${YELLOW}Start shoovly repository${END}"

# Test that git repository exist.
if [ ! -d .git ]; then
  echo "${RED}> Script should be running in exist git repository.${END}"
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
  echo -n "${RED}> Behat directory already exist. Do you want overide it?${END} "
  read answer
  # If behat folder exist and user answer is yes.
  if echo "$answer" | grep -iq "^y"; then
    # Remove an user behat folder.
    # To restore folder execute: git reset --hard
    rm -rf behat
    # Run initilisation of behat folder.
    init_behat
  fi
else
  # Run initilisation of behat folder.
  init_behat
fi

# Remove temporary folder.
rm -rf $TEMP_DIR

# show git status
git status

# Can we commit?
echo -n "${YELLOW}> Can we commit it?${END} "
read answer
# If behat folder exist and user answer is yes.
if echo "$answer" | grep -iq "^y"; then
  git commit -am 'Shoovify complete!'
fi

echo "${YELLOW}Shoov is configured. Now you can activate your repository on shoov.io.${END}";
echo "${YELLOW}Also you can run tests by next command: cd behat && bin/behat${END}"

exit 0
