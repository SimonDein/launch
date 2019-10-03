// What will the code below output?

function func() {
  return this;
}

var context = func();

console.log(context);
// window or global (depending on JS environment).
// Functions are implicitly given the context of the global object