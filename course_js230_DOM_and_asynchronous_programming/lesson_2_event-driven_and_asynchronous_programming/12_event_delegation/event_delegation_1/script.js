document.addEventListener('DOMContentLoaded', _ => {
  let messageSpan = document.getElementById('message');

  document.addEventListener('click', event => {
    let message = '';

    if (event.target.tagName === 'BUTTON') {
      message = `${event.target.textContent} was clicked`
    }
    
    messageSpan.textContent = message;
  });
});