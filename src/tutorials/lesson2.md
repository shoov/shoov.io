---
layout: page
title: Lesson 2 - Setup a GitHub repository
---

The following section can be used on existing repositories, but for the sake of simplicity lets create a new repository in GitHub.

Go ahead and make it public if you want, so other could educate from it.

![Create a GitHub repository](/assets/images/tutorials/lesson2/create-repo.jpg)

Next we will scaffold all the needed files. For this we will use the previously installed generator-shoov. Execute the command from inside the newly created and cloned repository.

```bash
yo shoov --base-url=http://pages.shoov.io
```

This will scaffold the following files and directories:

```
.shoov.yml
|
|-- visual-monitor
|
|-- behat
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
