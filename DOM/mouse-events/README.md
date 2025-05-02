On click, there are three mouse events in the following sequence:
1. mousedown
2. mouseup
3. click

dblclick fires after two of the click sequences.

mousemove fires repeatedly. Due to the performance implications, it is best practice to remove a mousemove event handler as soon as it is no longer needed.

mouseover fires when the cursor enters an element's boundaries.

mouseout fires when the cursor moves outside an element.

mouseenter / mouseleave - same, except they do not buble and do not fire when the cursor moves over descendant elements.
