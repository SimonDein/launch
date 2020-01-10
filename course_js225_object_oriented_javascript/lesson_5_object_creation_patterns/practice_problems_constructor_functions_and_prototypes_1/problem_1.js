// What does the following code log to the console?
var a = 1;
var foo;
var obj;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

foo = new Foo(); // creates new object, new objects prototype is Foo.object -> this in Foo is set to new obj -> 'a' on obj is set to 2 -> bar() is called and logs 'a', which is 2

foo.bar(); // calls bar() on foo -> logs val of a on foo, which is 2
Foo(); // Sets the global objects' property 'a' to 2, and logs the global property 'a' which is 2.

obj = {};
Foo.call(obj); // calls Foo obj, sets 'a' to 2 -> calls bar() -> and logs 'a', which is 2.
obj.bar(); // call bar on obj, -> logs 'a' on bar, which is 2.

console.log(this.a);  // logs the global property 'a' which is 2 (was set on the function call on line 17)

// 
