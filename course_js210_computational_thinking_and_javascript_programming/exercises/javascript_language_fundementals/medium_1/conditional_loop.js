// The following program is expected to log each number between 0 and 9 (inclusive) that is a multiple of 3. Read through the code shown below. Will it produce the expected result? Why or why not?

var i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } else {
    i += 1;
  }
}

/*

It will be stuck in an infinite loop and keep printing out 0.
i should be incremented after logging the multiple of 3 on line 6.

The modular operator will return 0 when it is used on 0.

*/