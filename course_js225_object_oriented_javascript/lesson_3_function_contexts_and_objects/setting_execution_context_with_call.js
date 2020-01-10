/*
Function.prototype.call() acts kind of the same way of calling a method.
When calling a method:
  - We call a function ON an object
  - A function defined ON the object

When using call():
  - We call a function WITH an object
  - The function can come from anywhere, but we can call it as if defined on the object
*/

let strings = {
  a: 'Hello',
  b: 'World',
  printAOnObject: function() {
    console.log(this.a);
  }
}

let numbers = {
  a: 1,
  b: 2,
}

strings.printAOnObject.call(numbers) // 1
