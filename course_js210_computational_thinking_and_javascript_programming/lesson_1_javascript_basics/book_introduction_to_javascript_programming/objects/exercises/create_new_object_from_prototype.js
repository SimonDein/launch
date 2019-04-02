// Create a new object that uses myProtoObj as its prototype.

let myProtoObj = {
  foo: 1,
  bar: 2,
};

let myNewObj = Object.create(myProtoObj);
