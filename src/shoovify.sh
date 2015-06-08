#!/usr/bin/env bash

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

# Unpack behat enviroment.
tar zxf $TEMP_DIR/behat/behat-vendor.tar.gz -C $TEMP_DIR/behat

# Move behat enviroment with tests to root directory.
mv $TEMP_DIR/behat ./

# Remove temporary folder.
rm -rf $TEMP_DIR

# Create a behat local config.
cp ./behat/behat.local.yml.example ./behat/behat.local.yml

# Show git status?
# Make new commit?
# Push to server?

echo 'Shoov is configured. Now you can activate your repository on shoov.io.';
echo 'Also you can run tests by next command: cd behat && bin/behat'

exit 0
