---
layout: page
title: Lesson 2 - Scaffold a new or existing repo
---


## Scaffold

```bash
yo shoov
```

## Visual monitor first time

```bash
cd visual-monitor
PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha
```

Watch the test in BrowserStack.

Open the new `webdrivercss` folder and see the baseline image.

Note when adding `git add webdriver` it will add only the files that end with baseline.png.

Re run `PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha` to validate the baseline is correct. If a regression is created it means that there is dynamic content on the page that will need to be excluded or removed.

## Functional monitor first time

```bash
cd ../behat
./bin/behat
```
