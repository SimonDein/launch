function average(args) {
  let sum = args.reduce((sum, number) => sum + number);
  let average = (sum / args.length);
  return average;
}

function getGrade(points) {
  if        (points >= 90) {
    return 'A';
  } else if (points >= 70) {
    return 'B';
  } else if (points >= 50) {
    return 'C';
  } else {
    return 'F';
  }
}

let grades = [];

for(let i = 1; i <= 3; i++) {
  let score = prompt(`Enter score ${i}: `);
  grades.push(score);
}

let points = average(grades);
let grade = getGrade(points);

console.log(`Based on the three scores your grade is "${grade}"`);
