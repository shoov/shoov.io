---
layout: default
title: Lesson 1 - Installation
---

## Mac

* Install [Brew](http://brew.sh/)

```bash
brew install graphicsmagick

# You might `sudo` for the below command
npm install -g mocha yo generator-shoov

# Install composer globally

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

## Ububntu

```bash
sudo apt-get install graphicsmagick

# You might `sudo` for the below command
npm install -g mocha yo generator-shoov

# Install composer globally
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

# One time Setup

1. Login to Shoov
1. Register to BrowserStack or Sauce Labs
1. Add credentials under my-account

Get the `~/.shoov.json` file by following copy/ pasting the code in your termnial.

Validate the code is there `cat ~/.shoov.json`
