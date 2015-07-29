---
layout: page
title: Lesson 3 - Create a Baseline image (Static page)
---

Lets do our first visual monitoring test on a dummy page which is completely static - that is, a page that never changes and has no dynamic content in it.

```bash
git checkout -b lesson3
```

This page is with the URL http://shoov.io/dummy-pages/static-page

This is the most simple case as we simply need to set the correct URL. We already have the `baseUrl` set to http://shoov.io so we just need to adapt the following piece of code:


```js
it('should show the static page',function(done) {
  client
    .url(baseUrl + '/dummy-pages/static-page')
    .webdrivercss(testName + '.static', {
```

your file should now look like this***

We are ready to create our first baseline image. From `visual-monitor` folder execute the following command:

```bash
PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha
```

Open BrowserStack's automate page, and see how BrowserStack has provisioned a VM (virtal machine) with the exact same capabilites our test specfied - a Chrome browser, on Mac OSX.

Once finished you will find a new folder called `webdrivercss` - this is where all your baseline images will be saved.

You will see two files over there. We care only about the one that ends with `baseline.png` (in fact when we'll do `git add webdrivercss` it will add only the files that end with `baseline.png`, the rest are disregarded).

Lets confirm our baseline is correct by re-running the same test.

```bash
PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha
```

If everything went well, no regression should happen, and mocha will show us the test has finished without errors
