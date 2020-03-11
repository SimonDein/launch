/*
Update your solution to the previous problem to make the red X move as you move the mouse around the document instead of depending on clicks.

Update your solution to the previous problem to change the color of the red X to blue when the user presses the b key, green in response to the g key, and red in response to r. The X should continue to follow the mouse around.
*/
document.addEventListener('DOMContentLoaded', (_) => {
  let x = document.querySelector('.x');
  let xChildren = [].slice.call(x.children);

  document.addEventListener('mousemove', function(event) {
    x.style.top = `${event.clientY}px`;
    x.style.left = `${event.clientX}px`;
  });

  document.addEventListener('keydown', function(event) {
    let key = event.key;
    
    if (key === 'b') xChildren.forEach(el => setBackgroundColor(el, 'blue'));
    if (key === 'r') xChildren.forEach(el => setBackgroundColor(el, 'red'));
    if (key === 'g') xChildren.forEach(el => setBackgroundColor(el, 'green'));
  })
})

function setBackgroundColor(element, color) {
  element.style.backgroundColor = color;
}