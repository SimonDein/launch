const numberGuessingGame = (function () {
  let correctAnswer = null;
  let introMessage = null;
  let message = null;
  let guessCount = null;
  let playerHasWon = null;

  return {
    newGame: function(start=1, end=100) {
      correctAnswer = Math.floor(Math.random() * end + start);
      introMessage = `Guess a number between ${start} and ${end}`;
      playerHasWon = false;
      guessCount = 0;
    },

    getGuessMessage: function(guess) {
      guessCount += 1;

      if (guess === 0) {
        message = 'You have to enter a number';
      } else if (guess > correctAnswer) {
        message = 'The number is lower';
      } else if (guess < correctAnswer) {
        message = 'The number i higher';
      } else if (guess === correctAnswer) {
        message = `You guessed it! It took you ${guessCount} guesses!`;
        playerHasWon = true;
      }

      return message;
    },

    getIntroMessage: function() {
      return introMessage;
    },

    getPlayerHasWon: function() {
      return playerHasWon;
    }
  }
})()

document.addEventListener('DOMContentLoaded', _ => {
  const inputElem = document.querySelector('#guess');
  const form = document.querySelector('form');
  const messageElem = document.querySelector('.message');

  numberGuessingGame.newGame();
  messageElem.textContent = numberGuessingGame.getIntroMessage();
  
  form.addEventListener('submit', event => {
    event.preventDefault();
    let userGuess = Number(inputElem.value);
    messageElem.textContent = numberGuessingGame.getGuessMessage(userGuess);
  });
  
  form.addEventListener('reset', event => {
    event.preventDefault();
    numberGuessingGame.newGame();
    messageElem.textContent = numberGuessingGame.getIntroMessage();
  });
})