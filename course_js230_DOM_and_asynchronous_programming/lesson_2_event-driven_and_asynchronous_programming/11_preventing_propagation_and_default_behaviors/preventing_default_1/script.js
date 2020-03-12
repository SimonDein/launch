document.addEventListener('DOMContentLoaded', _ => {
  let a = document.getElementsByTagName('a')[0];
  a.addEventListener('click', event => {
    event.preventDefault();       // prevents the link from following through
    alert('You were prevented from following the link')
  })
});