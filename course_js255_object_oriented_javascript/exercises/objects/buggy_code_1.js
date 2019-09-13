// The code below is expected to output the following when run:

// > var helloVictor = createGreeter('Victor');
// > helloVictor.greet('morning');
// = "Good Morning Victor"

function createGreeter(name) {
  return {
    name: name,
    morning: 'Good Morning',
    afternoon: 'Good Afternoon',
    evening: 'Good Evening',
    greet: function(timeOfDay) {
      var msg = '';
      switch (timeOfDay) {
        case 'morning':
          msg += this.morning + ' ' + this.name;
          break;
        case 'afternoon':
          msg += this.afternoon + ' ' + this.name;
          break;
        case 'evening':
          msg += this.evening + ' ' + this.name;
          break;
      }
      
      console.log(msg);
    },
  };
}

// However, it instead results in an error. What is the problem with the code? Why isn't it producing the expected results?

// Answer: We don't refer to "this" when trying to access the properties on the object

let helloVictor = createGreeter('Victor');
helloVictor.greet('morning');