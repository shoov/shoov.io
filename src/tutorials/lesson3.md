---
layout: page
title: Lesson 3 - Create a Baseline image (Static page)
---

Lets do our first visual monitoring test on a dummy page which is completely static - that is, a page that never changes and has no dynamic content in it.

```bash
git checkout -b lesson3
```

This page is with the URL http://pages.shoov.io

This is the most simple case as we simply need to set the correct URL. We already have the `baseUrl` set to `http://pages.shoov.io` so we just need to adapt the following piece of code:


```js
it('should show the static page',function(done) {
  client
    .url(baseUrl)
    .webdrivercss(testName + '.static', {
```

your file should now look like this***

We are ready to create our first baseline image. From `visual-monitor` folder execute the following command:

```bash
PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha
```

Lets break the above command:
1. `PROVIDER_PREFIX=browserstack`: This tells our test to pick the configuration of BrowserStack, instead of for example using the default PhantomJs configuration.
1. `SELECTED_CAPS=chrome`: The selected capabilities for this is `chrome`. This is an arbitrary name that is indicated in our test as Chrome version 42.0 on a Mac Yosemite. You may add as many capabilities as you wish.
1. `mocha`: This executes all the tests under the `test` folder, and reports if tests failed or passed.

Open BrowserStack's automate page, and see how BrowserStack has provisioned a VM (virtal machine) with the exact same capabilities our test specified - a Chrome browser, on Mac OSX.

Once finished you will find a new folder called `webdrivercss` - this is where all your baseline images will be saved.

You will see two files over there. We care only about the one that ends with `baseline.png` (in fact when we'll do `git add webdrivercss` it will add only the files that end with `baseline.png`, the rest are disregarded - more on that file in the dynamic page tutorial***).

Lets confirm our baseline is correct by visually checking it and then by re-running the exact same test.

```bash
PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha
```

If everything went well, no regression should happen, and mocha will show us the test has finished without errors

We can now continue creating baselines for different browsers. The test doesn't need to change - only the way we invoke it. For example, to create the baseline for Internet Explorer 11, we can execute it as follows:

```bash
PROVIDER_PREFIX=browserstack SELECTED_CAPS=ie11 mocha
```
