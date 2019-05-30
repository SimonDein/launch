function radianToDegree(radian) {
  let degrees = (radian * 180) / Math.PI;
  return degrees;
}

console.log(radianToDegree(3.14)); // 179.908...;
console.log(radianToDegree(1)); // 57.29577....;
