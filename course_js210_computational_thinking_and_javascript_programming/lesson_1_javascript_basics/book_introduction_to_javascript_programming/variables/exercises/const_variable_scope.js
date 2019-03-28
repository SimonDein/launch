// Will this program produce an error when run? Why or why not?

const FOO = 'bar';
{
  const FOO = 'qux';
}

console.log(FOO);

/*
No it won't, 'bar' will be printed as the inner constant is another intance than
the outer one. The inner constant shadows the outer inside the brackets.

*/