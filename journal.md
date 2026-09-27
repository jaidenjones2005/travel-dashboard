# Phase 1 - Visual Foundation

ThemeData seems convenient because it lets me control the overall look of
the app from one place. Instead of styling every widget individually, I
can create colors and text styles once and reuse them throughout the app.

The complicated part is that ThemeData has a lot of different properties,
so it can be confusing at first to know which property controls each part
of the app. I think it will become easier as I use it more.

# Phase 2 - Adaptive Navigation

When designing breakpoints, I think I need to consider how much space
the content and navigation need to display correctly. A layout that works
on a desktop might become crowded or difficult to use on a smaller phone
screen.

MediaQuery can be used to check the width and height of the screen and
change the layout based on the available space. It could also be used to
adjust things like font sizes, spacing, padding, or the number of items
displayed on the screen.