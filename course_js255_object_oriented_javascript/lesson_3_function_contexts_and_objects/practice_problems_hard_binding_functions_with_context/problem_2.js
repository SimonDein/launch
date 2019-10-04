// What will the code below log to console?

var obj = {
  message: 'JavaScript',
};

function foo() {
  console.log(this.message);
}

foo.bind(obj);
//nothing - foo() is never called. Had it been called however, 'JavaScript' would be printed