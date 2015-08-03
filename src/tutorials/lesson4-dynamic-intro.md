---
layout: page
title: Lesson 4 - Dynamic Elements Intro
---

# Overview

[Previous chapter](/tutorials/lesson3-static-page/) was dealing with a completely static page. That means that no matter how many times we refresh the page, it will always look the same.

Websites however tend to be more dynamic. But how would a pixel-by-pixel comparison work with such pages? By ignoring them.

> Tip: Don't worry if some pages are too dynamic and you'll need to ignore most of the page. Even covering some percentage is much better than none. Furthermore, the "ignored" parts can be later tested with functional testing.

webdriverCSS has three handy commands that helps us with dynamic elements: `exclude`, `remove` and `hide`. These commands receive a list of CSS selectors and are the key for creating baseline images that can be continuously repeated and always produce the exact same result.

* `exclude`: Place a black rectangle on top of the selected element.
* `remove`: Completely remove the element, so it won't take any space. Under the hood it's using `display: none`.
* `hide`: Hide the element, but keep the space it's taking. Under the hood it's using `visibility: hidden`.

# Ignore Strategy

What is better, to exclude or to remove? Well, as always - it depends.

By default you should try to `exclude`. Even if the element is dynamic, it might be valuable to assert at least it's present on the page. Even though the content may be dynamic, it's size may be fixed. So for example, and ad can change on every page refresh, but you would like to assert it's always placed in the exact same place, and its always in the exact same width and height.

But fixed size isn't always the case for dynamic content. A tweet can be consisted of a single or several lines - no way for us to predict. In such cases the `remove` should be used.

Also, if you use `exclude`, but the size of the excluded element is bigger than the size of the non-excluded elements, you may use to `remove`. A huge black rectangle is just adding size to the baseline image, but has little value. Finding the balance is the key factor here.

This leaves us with `hide`. The reason it's not often used is because we'd most cases opt with `remove`. However on cases such elements as a carousel, where some elements are hidden by `overflow`, using `exclude` will result with black rectangles in unexpected areas. Or, again with a carousel example, the black rectangle may hide the caption - which is in a fixed size.

A rule of thumb is that `hide` is usually used to elements that have child elements that exceed the size of the parent.

## Fixed elements

Before we try to tackle complex scenarios, we still need to figure out how to capture the previous static page on IE - as it resulted with the fixed navbar being duplicated.

Now that we know the most common commands, we can already fix our problem!

We can simply `remove` the navbar. But what about checking the navbar on IE?
We can always keep it on Chrome, and remove it just for IE. Something like this:

```js
.webdrivercss(testName + '.homepage', {
  name: '1',
  remove: [
    // Hide the navbar on IE, as it's fixed and is duplicated.
    selectedCaps == 'ie11' ? '.navbar-fixed-top' : '',
  ],
  // ...
}
```

This is a good solution, but we can actually write another test specifically for IE that it will capture only the navbar. For that we will use the `elem` property which accepts a CSS selector, and will capture only that element. We could then wrap our test with an `IF` statement, that will be executed only if the selected capabilities is IE.

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

In the [next chapter](/tutorials/lesson5-dynamic-complex/) we will dive into more complex dynamic elements.
