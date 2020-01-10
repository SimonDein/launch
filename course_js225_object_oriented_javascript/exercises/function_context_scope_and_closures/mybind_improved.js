//  Our earlier implementation of the Function.prototype.bind was simplistic.
//  Function.prototype.bind has another trick up its sleeve besides hard-binding functions to context objects.
//  It's called partial function application.
//  Read this assignment and the MDN documentation to learn more about partial function application.

// Alter the myBind function written in the previous exercise to support partial function application.


function myBind(func, context, ...partials) {
  return function(...args) {
    let allArgs = args.concat(partials);
    return func.apply(context, allArgs);
  }
}

let superman = {
  name: 'Clark Kent',
  superpowers: ['flying', 'super-human powers'],
}

function introducer(nickName, age) {
  console.log(`Aaaand next up we have ${this.name}`);
  console.log('This guys superpowers include:');
  this.superpowers.forEach((superpower) => console.log(`${superpower}`));
  console.log(`He's ${age}, and also goes by the name '${nickName}'`);
}

let supermanIntroduction = myBind(introducer, superman, 36);
supermanIntroduction('Clarky');
