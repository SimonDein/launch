// Implement an ancestors method that returns the prototype chain (ancestors) of a calling object as an array of object names.
//
// Here's an example output:
// name property added to make objects easier to identify
var foo = {name: 'foo'};
var bar = Object.create(foo);
bar.name = 'bar';
var baz = Object.create(bar);
baz.name = 'baz';
var qux = Object.create(baz);
qux.name = 'qux';

Object.prototype.ancestors = function() {
  let prototypes = [];
  let currentProto = this;
  for (;;) {
    currentProto = Object.getPrototypeOf(currentProto);
    if (currentProto === Object.prototype) break;
    prototypes.push(currentProto.name);
  }
  prototypes.push('Object.prototype');
  return prototypes;
}


console.log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
console.log(baz.ancestors());  // returns ['bar', 'foo', 'Object.prototype']
console.log(bar.ancestors());  // returns ['foo', 'Object.prototype']
console.log(foo.ancestors());  // returns ['Object.prototype']
