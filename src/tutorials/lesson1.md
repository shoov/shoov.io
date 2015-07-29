---
layout: page
title: Lesson 1 - Installation & Setup
---

## Installation

```bash
# You might need to `sudo` for the below command
npm install -g mocha yo generator-shoov

# Install composer globally

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

### Mac

Install [Brew](http://brew.sh/)

```bash
brew install graphicsmagick
```

### Ububntu

```bash
sudo apt-get install graphicsmagick
```

# One time Setup

1. Login to Shoov
1. Register to [BrowserStack](http://www.browserstack.com/) (You can also use Sauce Labs, but for this tutorial we have chosen BrowserStack as it provides a more a affordable solution. If you have Sauce labs account you can skip to section (4) and add your Sauce Labs credentials instead)
1. Get your BrowserStack [credentials](https://www.browserstack.com/automate)
![BrowserStack credentials](/assets/images/tutorials/lesson1/browserstack-credentials.jpg)
1. Login to [Shoov](https://app.shoov.io/)
1. Add the credentials under [my-account](https://app.shoov.io/#/my-account)
![Adding BrowserStack credentials to My account](/assets/images/tutorials/lesson1/my-account.jpg)
1. Get the `~/.shoov.json` file by following copy/ pasting the code in your terminal. This file holds your Shoov access token, and the BrowserStack credentials which will be automatically be picked up when doing visual monitoring
