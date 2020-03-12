document.addEventListener('DOMContentLoaded', _ => {
  const button = document.getElementsByTagName('button')[0];
  const a = document.getElementsByTagName('a')[0];

  button.addEventListener('click', event => {
    event.preventDefault();
    alert('The default was prevented');
  })

  a.addEventListener('click', event => {
    event.stopPropagation();
    alert('The propagation was prevented and the link is followed')
  }, true)
});

/*
The link is set to trigger its event in the capturing phase.
Then it prevent propagation - stopping the button's event from
preventing the link to be followed.
So the link is followed and is never prevented.
*/