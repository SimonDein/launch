/*
write JavaScript to add a character counter that updates as the user types
Note that the text should turn red when you have more than 140 characters in the text box.
*/

document.addEventListener('DOMContentLoaded', function(_) {
  const MAX_NUM_OF_CHARACTERS = 140;
  let textArea = document.body.querySelector('textarea');
  let counter = document.body.querySelector('.counter');
  let button = document.body.querySelector('button');
  
  function updateTextAreaFeeback() {
    let characterCount = textArea.textLength;
    let charactersRemaining = MAX_NUM_OF_CHARACTERS - characterCount;
    counter.textContent = `${charactersRemaining} characters remaining`;

    let invalid = charactersRemaining < 0;

    textArea.classList.toggle('invalid', invalid);
    button.disabled = invalid;
  }

  textArea.addEventListener('input', updateTextAreaFeeback) ;
  updateTextAreaFeeback();
});