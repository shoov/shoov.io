---
layout: tutorial
title: Lesson 2 - Setup a GitHub repository
---

The following section can be used on existing repositories, but for the sake of simplicity lets create a new repository in GitHub.

Go ahead and make it public if you want, so other could learn from it.

![Create a GitHub repository](/assets/images/tutorials/lesson2/create-repo.jpg)

> Tip: Make sure to add a README.md file - like this your repository won't be empty.

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

For now we care about the `visual-monitor` folder so you can navigate there `cd visual-monitor`

In [next chapter](/tutorials/lesson3-static-page/) we will create our first visual regression test
