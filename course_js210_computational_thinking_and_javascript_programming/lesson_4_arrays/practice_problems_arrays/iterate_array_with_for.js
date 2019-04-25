// Create a function named rollCall that takes an array of first names as an argument and logs all the names to the console, one name per line. You should log the names in the same sequence they appear in the array. Use a for loop to process the array.

function rollCall(arr) {
  for(let i = 0; i < arr.length; i += 1) {
    console.log(arr[i]);
  }
}

let names = ['Baidur', 'Sven', 'Gyritte', 'Doom Killer'];
rollCall(names);