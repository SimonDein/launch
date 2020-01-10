// Method declaration
let greeter = {
  goodMorning: function() {
    console.log("Good morning, you bastard!")
  }
}

// Function declaration
function goodEvening() {
  console.log("Good evening, you're still a bastard!")
}

// Method invocation: explicit reciever
greeter.goodMorning();

// Function invocation: there's no explicit reciever
goodEvening();