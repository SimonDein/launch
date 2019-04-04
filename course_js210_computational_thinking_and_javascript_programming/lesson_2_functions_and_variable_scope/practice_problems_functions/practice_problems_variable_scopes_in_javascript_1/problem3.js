// Please predict the output of the following programs, and explain why they output what they do.

var basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket);

  function shop2() {
    basket = 'computer';
  }

  function shop3() {
    var basket = 'play station';
    console.log(basket);
  }

  shop1();
  shop2();
  shop3();

  console.log(basket);
}

goShopping();

/*
Line 10 outputs 'empty'.

Line 23 will result in line 18 printing out 'playstation' as line 17 creates a new local variable
basket and assigns it to the value.
Line 25 will output 'computer' as the value global variable didn't change in function shop3()
*/