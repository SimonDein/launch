var readlineSync = require('readline-sync')

var name = readlineSync.question("What's your name? \n")
console.log(`Oh hello there, ${name}`)