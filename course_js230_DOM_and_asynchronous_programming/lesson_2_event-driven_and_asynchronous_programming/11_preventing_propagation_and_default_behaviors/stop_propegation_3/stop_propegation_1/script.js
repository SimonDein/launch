function setBackgroundRed (event) {
  event.stopPropagation(); // stops the event from bubbling
  event.currentTarget.style.background = 'red';
}

document.addEventListener('DOMContentLoaded', _ => {
  let outerDiv = document.querySelector('.outer');
  let innerDiv = document.querySelector('.inner');


  // The event on the outer div will trigger on the capturing phase and therefore prevent the event -
  // from ever reaching the inner div.
  
  // the 3rd arg - the boolean sets the event to fire on the capturing phase instead of - the default - bubbling phase.
  outerDiv.addEventListener('click', setBackgroundRed, true);
  innerDiv.addEventListener('click', setBackgroundRed);
});