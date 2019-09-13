
// Suppose we want to use code to keep track of products in our hardware store's inventory.
// A first stab might look something like this:
// var scissorsId = 0;
// var scissorsName = 'Scissors';
// var scissorsStock = 8;
// var scissorsPrice = 10;

// var drillId = 1;
// var drillName = 'Cordless Drill';
// var drillStock = 15;
// var drillPrice = 45;

function createProduct(id, name, stock, price) {
  return {
    id: id,
    name: name,
    stock: stock,
    price: price,

    describe: function() {
      console.log(`id: ${this.id}`)
      console.log(`name: ${this.name}`)
      console.log(`stock: ${this.stock}`)
      console.log(`price: ${this.price}`)
    },
  
    setPrice: function(price) {
      if (price < 0) {
        console.log('Invalid price: The price is negative');
        return;
      }
    
      this.price = price;
    },
  };
};

let scissors = createProduct(0, 'scissors', 8, 3.5);
let drill = createProduct(1, 'Cordless Drill', 2, 45);

scissors.describe()
drill.describe()

