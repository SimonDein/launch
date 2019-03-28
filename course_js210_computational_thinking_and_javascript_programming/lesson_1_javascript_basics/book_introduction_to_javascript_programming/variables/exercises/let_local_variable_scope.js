// What does this program log to the console? Why?

let foo = 'bar';
{
  let foo = 'qux';
}

console.log(foo);

/*
1. First we declare the local variable foo to the string 'bar'

2. Then we define an inner scope where we instatiate another local variable
   also called foo, but assigned to the string 'qux'. This variable shadows (hides)
   the outer scope variable with the same name,

3. Then we exit the inner scope and log the local variable foo which is accessible -
   the first one with assigned to the string 'bar'.
*/

