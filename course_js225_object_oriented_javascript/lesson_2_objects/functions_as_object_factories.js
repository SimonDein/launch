
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

let sedan = makeCar(20); // { speed: 0, speedRate: 20, accelerate: [Function: accelerate] }
let coupe = makeCar(40); // { speed: 0, speedRate: 40, accelerate: [Function: accelerate] }

