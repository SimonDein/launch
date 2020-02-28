// Write a function named afterNSeconds that takes two arguments: a callback and a time duration in seconds. The function should wait for the indicated period, then invoke the callback function.

const MILISECONDS_IN_A_SECOND = 1000;

function afterNSeconds(n, callback) {
  setTimeout(callback, n * MILISECONDS_IN_A_SECOND);
}

afterNSeconds(3, () => { console.log('Hey 3 seconds has passed!') });