
let makeCar = function(speedRate) {
  let car = {
    speed: 0,
    speedRate: speedRate,

    accelerate: function() {
      this.speed += this.speedRate;
    },
  };

  return car;
};

let sedan = makeCar(20);
let coupe = makeCar(40);

