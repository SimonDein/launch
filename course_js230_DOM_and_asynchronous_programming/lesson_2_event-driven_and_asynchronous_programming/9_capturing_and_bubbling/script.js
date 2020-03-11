document.addEventListener('DOMContentLoaded', _ => {
  let element4 = document.querySelector('#elem4');
  let element2 = document.querySelector('#elem2');

  element2.addEventListener('click', (event) => alert(event.currentTarget.id), true);
  element4.addEventListener('click', (event) => alert(event.currentTarget.id), true);
});