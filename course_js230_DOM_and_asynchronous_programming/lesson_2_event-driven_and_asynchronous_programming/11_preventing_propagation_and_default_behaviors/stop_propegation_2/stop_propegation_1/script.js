function setBackgroundRed (event) {
  event.stopPropagation(); // stops the event from bubbling
  event.currentTarget.style.background = 'red';
}

document.addEventListener('DOMContentLoaded', _ => {
  let outerDiv = document.querySelector('.outer');
  let innerDiv = document.querySelector('.inner');

  /*
  This time the event.stopPropagation prevents the event from bubbling.
  Therefore a click in the inner div will not have an effect on click event on the outer div -
  as it does not bubble up.
  */
  outerDiv.addEventListener('click', setBackgroundRed);
  innerDiv.addEventListener('click', setBackgroundRed);
});