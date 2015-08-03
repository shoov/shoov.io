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
