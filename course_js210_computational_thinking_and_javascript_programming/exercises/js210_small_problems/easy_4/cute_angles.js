// Write a function that takes a floating point number representing an angle between 0 and 360 degrees, and returns a string representing that angle in degrees, minutes, and seconds. You should use a degree symbol (˚) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.
// Note: your results may differ slightly depending on how you round values, but should generally be within a second or two of the results shown.
/*
PEDAC -------
Problem:
  Input:
    - Number
      - represents degrees

  Output:
    - String
      - degrees(°), minutes(') and seconds(")
  Rules:
    - 1° = 60minutes
    - 1 minute = 60 seconds

Data Structure:

Algorithm:
    Example input: E
  - get degrees
    - whole angle = degrees
  - get minutes
    - 60 * fraction rounded down
  - get seconds
    - fraction of minutes * 60 rounded down
  - return degrees + minutes + seconds
*/

const MINUTES_PER_DEGREE = 60;
const SECONDS_PER_MINUTE = 60;

function dms(angle) {
  let degrees = angle;
  let minutes = MINUTES_PER_DEGREE * (angle % 1);
  let seconds = SECONDS_PER_MINUTE * (minutes % 1);
  return `${Math.floor(degrees)}°${Math.floor(minutes).toPrecision(2)}'${Math.floor(seconds).toPrecision(2)}"`
}


console.log(dms(30));           // 30°00'00"
console.log(dms(76.73));        // 76°43'48"
console.log(dms(254.6));        // 254°35'59"
console.log(dms(93.034773));    // 93°02'05"
console.log(dms(0));            // 0°00'00"
console.log(dms(360));          // 360°00'00" or 0°00'00"
