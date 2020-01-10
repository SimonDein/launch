// What will the code below log to the console?

var positiveMentality = {
  message: 'JavaScript makes sense!',
};

var negativeMentality = {
  message: 'JavaScript makes no sense!',
};

function foo() {
  console.log(this.message);
}

var bar = foo.bind(positiveMentality);

negativeMentality.logMessage = bar;
negativeMentality.logMessage();

/*
Line 18 will print 'JavaScript makes sense!'.
Line 17 assing logMessage to the variable bar
the variable bar is assigned to the function foo on line 11 and bound the context positiveMentality on line 3
*/