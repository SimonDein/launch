/*
Starting with the HTML below, write some JavaScript code to move the red X to the last position in the document that the user clicked. Click the "EDIT ON CODEPEN" button on the upper-right to edit the template.
*/

document.addEventListener('DOMContentLoaded', (_) => {
  let x = document.querySelector('.x');

  document.addEventListener('click', function(event) {
    x.style.top = `${event.clientY}px`;
    x.style.left = `${event.clientX}px`;
  })
})