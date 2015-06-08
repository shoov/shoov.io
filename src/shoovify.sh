#!/usr/bin/env bash

init_behat () {
  # Move behat folder to root.
  mv $TEMP_DIR/behat ./
  # Create a behat local config.
  cp ./behat/behat.local.yml.example ./behat/behat.local.yml
  # Add behat folder to git.
  git add behat
}

# Test that git repository exist.
if [ ! -d .git ]; then
  echo 'Script should be running in exist git repository.'
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
  echo -n "Behat directory already exist. Do you want overide it?"
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
echo -n "Can we commit it?"
read answer
# If behat folder exist and user answer is yes.
if echo "$answer" | grep -iq "^y"; then
  git commit -am "Shoovify complete!"
fi

echo 'Shoov is configured. Now you can activate your repository on shoov.io.';
echo 'Also you can run tests by next command: cd behat && bin/behat'

exit 0
