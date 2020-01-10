// What will the code below output?
var obj = {
  a: 'Amazebulous!',
};
var otherObj = {
  a: "That's not a real word!",
};

function foo() {
  console.log(this.a);
}

var bar = foo.bind(obj);

bar.call(otherObj);

/*
Line 15 will output 'Amazebulous!'
Even though we try to call the function in context of otherObj, because the context of bar is bound,
its context cannot be changed.
*/