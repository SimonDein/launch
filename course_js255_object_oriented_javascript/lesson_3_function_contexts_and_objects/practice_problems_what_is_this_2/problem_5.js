// What does the following code log to the console?
// If you want this program to log 34000, how would you fix it?
var computer = {
  price: 30000,
  shipping: 2000,
  total: function() {
    var tax = 3000;
    let self = this;

    let specialDiscount = function() {
      if (self.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    };

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());


/*
This will log 35000 - the if statement will never be true since it evaluates to undefined due to functions context is -
the global object. Since the global object don't have a price property defined, it will evaluated to undefined.

We can use bind(), call() or apply() to get the context of the object.
In this case i assign this to a variable accesible inside the function.
It's easy to read and we don't hard bind it.
*/
