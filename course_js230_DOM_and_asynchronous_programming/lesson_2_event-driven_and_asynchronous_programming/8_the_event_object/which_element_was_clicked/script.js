document.addEventListener('DOMContentLoaded', (_) => {
  let p = document.querySelector('p');
  
  document.body.onclick = function (event) {
    let currentElement = event.target;
    p.textContent = `${currentElement.nodeName} was clicked`;
  }
});