---
layout: page
type: tutorial
title: Lesson 3 - First Baseline Image
---

> Tip: The final result of this tutorial can be seen in this [repository](https://github.com/shoov/getting-started-example/blob/master/visual-monitor/test/tests.js)

Lets do our first visual regression test on a dummy page which is completely static - that is, a page that never changes and has no dynamic content in it. The URL is http://pages.shoov.io

This is the most simple case as we simply need to set the correct URL. We already have the `baseUrl` set to `http://pages.shoov.io` so we just need to adapt the following piece of code:


```js
it('should show the static page',function(done) {
  client
    .url(baseUrl)
    .webdrivercss(testName + '.static', {
```

We are ready to create our first baseline image. From `visual-monitor` folder execute the following command:

```bash
PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha
```

Lets break the above command:

1. `PROVIDER_PREFIX=browserstack`: This tells our test to pick the configuration of BrowserStack, instead of for example using the default PhantomJs configuration.
1. `SELECTED_CAPS=chrome`: The selected capabilities for this is `chrome`. This is an arbitrary name that is indicated in our test as Chrome version 42.0 on a OS X Yosemite. You may add as many capabilities as you wish.
1. `mocha`: This executes all the tests under the `test` folder, and reports if tests failed or passed.

Open BrowserStack's [automate](https://www.browserstack.com/automate) page, and see how BrowserStack has provisioned a VM (virtual machine) with the exact same capabilities our test specified.

![BrowserStack automate page](/assets/images/tutorials/lesson3/automate.jpg)

Once finished you will find a new folder called `webdrivercss` - this is where all your baseline images will be saved.

You will see two files over there. We care only about the one that ends with `baseline.png` .In fact when we'll do `git add webdrivercss` it will add only the files that end with `baseline.png`, the rest are disregarded.

Lets confirm our baseline is correct by visually checking it and then by re-running the exact same test.

```bash
PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha
```

If everything went well, no regression should happen, and mocha will show us the test has finished without errors, and we can commit the files.

```bash
git add .
git commit -am "Add baseline images for Chrome"
```

We can now continue creating baselines for different browsers. The test doesn't need to change - only the way we invoke it. For example, to create the baseline for Internet Explorer 11, we can execute it with the following command:

```bash
PROVIDER_PREFIX=browserstack SELECTED_CAPS=ie11 mocha
```

But wait, don't commit the IE baseline image yet! Open the image that was done for IE. Have a close look. Is it ok?

Unfortunately, yet unsurprisingly, IE behaves differently than Chrome. The fixed navbar seems to repeat when the smaller images created by webdriverCSS are "stitched" together, resulting with a wrong image (we're trying to fix the issue [issue]((https://github.com/webdriverio/webdrivercss/issues/56)) in webdriverCSS).

![The fixed navbar is duplicated](/assets/images/tutorials/lesson3/ie-fixed-navbar.jpg)

In the [next chapter](/tutorials/lesson4-dynamic-intro/) we will see how to deal with this.
