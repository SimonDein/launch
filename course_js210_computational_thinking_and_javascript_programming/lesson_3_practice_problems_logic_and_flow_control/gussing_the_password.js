// Write a password guessing program that tracks how many times the user enters the wrong password
// If the user enters the password wrong three times, log 'You have been denied access
//' and terminate the program
// If the password is correct, log 'You have successfully logged in.' and end the program.

for(i = 3; i >= 0; i--) {
  const PASSWORD = '123';
  guess = prompt('Enter password');

  if (guess === PASSWORD) {
    console.log('You have successfully logged in.')
    break;
  } else {
    if (i === 0) {
      console.log('You have been denied access');
    } else {
      console.log('Wrong password, please try again.');
    }
  }
}



