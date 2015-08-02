---
layout: page
title: Lesson 4 - Dynamic Elements Intro
---

# Overview

Previous page was completely static. That means that no matter when we navigate to it, it will always look the same.
Websites however tend to be more dynamic. But how would a pixel-by-pixel comparison work with such pages? By ignoring them.

<div class="tip">
Tip: Don't worry if some pages are too dynamic and you'll need to ignore most of the page. Even covering some percentage is much better than none. Furthermore, the "ignored" parts can be later tested with functional testing. More on that in ***
</div>

webdriverCSS has three handy commands that helps us with dynamic content: `exclude`, `remove` and the less used `hide`. These commands receive a list of CSS selectors and are the key for creating baselines that can be continously repeated and always produce the exact same result.

* `exclude`: Place a black rectangle on top of the selected element.
* `remove`: Completely from the element, so it won't take any space. Under the hood it's using `display: none`.
* `hide`: Hide the element, but keep the space it's taking. Under the hood it's using `visibility: hidden`.

## How to decide the ignoring method

What is better, to exclude or to remove? Well, as always - it depends.

By default you should probably exclude. Even if the element is dynamic, it might be valuable to assert at least it's present on the page, and more importantly - the content may be dynamic, but it's size is fixed. So for example, and ad can change on every page refresh, but you would like to assert it's always placed in the exact same place, and its always in the exact same width and height.

As mentioned above, the dynamic content isn't always in a fixed size. A tweet can be consisted of a single or several lines - no way to predict. In such cases the `remove` should be used.

This leaves us with `hide`. The reason it's not often used is because we'd most cases opt with `remove`. However on cases such as a carousel, where some elements are hidden by `overflow`, using `exclude` will result with black rectangles in unexpected areas. Or, again with a carousel example, the black rectangle may hide the caption - which is in a fixed size.

## Fixed elements

Before we try to tackle complex scenarios, we still need to figure out how to capture the previous static page on IE - as it resulted with the fixed navbar being duplicated.

Now that we know the most common commands, we can already fix our problem!

We could simply `remove` the navbar but maybe we can take a more balanced approach. How about, keeping it on Chrome, and remove it just for IE.

Say something like this.

```js
.webdrivercss(testName + '.homepage', {
  name: '1',
  remove: [
    // Hide the navbar on IE, as it's fixed.
    selectedCaps == 'ie11' ? '.navbar-fixed-top' : '',
  ],
  // ...
}
```

This is a good solution, but we can actually run write another test specifically for IE, where it will capture only the navbar. For that we will use the `elem` property which accepts a CSS selector, and will capture only that element. We could then wrap our test with an IF statement, that will be executed only if the selected capabilities are IE.

Something like this:

```js
if (selectedCaps == 'ie11') {

  it('should show the fixed navbar element',function(done) {
    client
      .url(baseUrl)
      .webdrivercss(testName + '.navbar', {
        name: '1',
        // Get only the fixed navbar.
        elem: '.navbar-fixed-top'
      }, resultsCallback)
      .call(done);
  });
};
```

In the next chapter we will dive into more complex dynamic elements.
