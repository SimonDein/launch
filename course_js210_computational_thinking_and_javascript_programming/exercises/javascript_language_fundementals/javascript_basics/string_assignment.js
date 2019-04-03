// Take a look at the following code:

var name = 'Bob';
var saveName = name;
name = 'Alice';
console.log(name, saveName);
// What does this code log to the console? Think about it for a moment before continuing.
// Alice Bob
// We reassign name to the string 'Bob'.

// Now let's look at something slightly different:

var name = 'Bob';
var saveName = name;
name.toUpperCase();
console.log(name, saveName);

// What does this code log? Can you explain these results?
// Bob Bob
// On line 15 we don't reassign the value returned from name.toUpperCase and therefore
// the result is "lost" and we don't see an effect.
