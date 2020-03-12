function setBackgroundRed (event) {
  event.currentTarget.style.background = 'red';
}

document.addEventListener('DOMContentLoaded', _ => {
  let outerDiv = document.querySelector('.outer');
  let innerDiv = document.querySelector('.inner');

  /*
  The event will bubble up to the outer div if the inner div is clicked.
  If the outer div is clicked only the outer div will turn red as the event is never passing the inner div.
  */
  outerDiv.addEventListener('click', setBackgroundRed, true);
  innerDiv.addEventListener('click', setBackgroundRed);
});