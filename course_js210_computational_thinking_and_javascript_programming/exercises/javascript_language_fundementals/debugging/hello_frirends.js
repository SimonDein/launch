// You have written basic functions to display a random greeting to any number of friends upon each invocation of greet. Upon invoking the greet function, however, the output is not as expected. Figure out why not and fix the code.

function randomGreeting() {
  let words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
               'Greetings', 'Salutations', 'Good to see you'];

  let idx = Math.floor(Math.random() * words.length);

  return words[idx];
}

function greet(...names) {
  let i;

  for (i = 0; i < names.length; i += 1) {
    let name = names[i];
    let greeting = randomGreeting();

    console.log(greeting + ', ' + name + '!');
  }
}

greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');