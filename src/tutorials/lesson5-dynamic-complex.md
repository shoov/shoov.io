---
layout: tutorial
title: Lesson 5 - Complex Dynamic Elements
---

## Planning

Let's look the dynamic page in http://pages.shoov.io/dynamic-page and decide how to deal with each element, remembering that `remove`, `exclude` and `hide` are our main tools.

![Dynamic elements](/assets/images/tutorials/lesson5/dynamic-elements.jpg)

We should break the task into smaller tasks:

1. The clock flip has hours, minutes and seconds that are fixed. Also the divider symbol (`:`) and the fact that we have two flip cards for each time interval.
1. The carousel has fixed width and height, and the caption is always in a single line.
1. The text on the right is dynamic, and every page refresh reveals that we can have between one to three paragraphes of random text.

> Tip: Different element, require different tools.

## Clock Flip - Not Just Exclude

If you think `exclude` is the right approach in order to hide the flip cards - you are _almost_ right. Look what happens when we execute the test (you may need to run it a few times to see the exact same error)

![Clock excluded incorrectly](/assets/images/tutorials/lesson5/clock-wings.jpg)

Those weird "wings" popping out over the flip card's black rectangle are the clock continuing to flip as we take the snapshot. Excluding the element didn't exclude all its child elements that are created and destroyed using JS.

In fact, we have an interesting situation here, where we want to `hide` the element (i.e. make it invisible, but keep the space) _and_ still mark it as black rectangle, so we get a visual confirmation the elements are there and in the right place and size.

Luckily we can apply two commands on the same element.

```js
.webdrivercss(testName + '.dynamic-homepage', {
  name: '1',
  exclude: [
    // Clock flip card.
    '#flip-clock .flip',
  ],
  hide: [
    // Since the clock is flipping, we want to make sure nothing gets out
    // of the frame, but keep the space.
    '#flip-clock .flip'
  ]
  // ...
}
```

Executing the tests with `PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha` validates that our solution is correct.

![Excluded clock](/assets/images/tutorials/lesson5/clock.jpg)

## Carousel

If your first reaction to carousel is to `exclude` - think again. Even though our carousel is of fixed size, exclude might not work here, or at least not be optimal.

Carousels usually work by having a list of existing elements hidden by playing with the `overflow` property. This creates the effect that elements are moving - while in fact they are somewhere to the right and left of the visible part of the carousel. By using `exclude` on the images, you might get an image with black rectangles in unexpected areas.

Furthermore, even if that wasn't the case, the black rectangle completely hides the carousel's left and right arrows, so being able to see them without much effort would be a nice plus.

This means we should probably `hide` the images instead of excluding them.

Now we need to deal with the captions and carousel indicators. Unfortunately `exclude` won't work for the same reasons we now understand about the images in the carousel.
Our options are `remove` or `hide`. Both will work in our example, however `hide` would probably be a better practice. Since `remove` completely hides the element and makes sure it no longer takes any space - we might create a distortion in the page, as elements that no longer take space, might be pushed by the elements below them.

![Hidden images in the carousel](/assets/images/tutorials/lesson5/carousel.jpg)

## Text

The text part is pretty straight forward. The text changes, and the height of it is unknown. A clear case of `remove`.


![End result](/assets/images/tutorials/lesson5/end-result.jpg)
