// What happens when you run the following program? Why do we get that result?

{
  let foo = 'bar';
}

console.log(foo);

/*
We get a ReferenceError as foo is a local variable to the scope of the enclosuring
brackets and not accassible outside the block.

If let had been instanziated before the block we would be able to access it though.
*/