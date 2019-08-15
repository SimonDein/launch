// Problem
// You have a bank of switches before you, numbered from 1 to n. Every switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass. On this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back to the beginning again, this time toggling switches 3, 6, 9, and so on. You continue to repeat this process until you have gone through n repetitions.

// Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.


/*
----- PEDAC -----

DISCLAIMER: The problem simply asks for any perfect squares >=N.
            But i want to describe the solution declaritively and act as it isn't that simple.

Input:
  - Number, reprents number of switches

Output:
  - Array of which switches are on after rules have applied

Rules:
  - Input represents number of switches
  - Input represents rounds
    - for each round
      - if switch num % roundNum === 0
        - toggle light

Datastructure:
  - Object for switches
    - We need to track index
    - Index is NOT 0 based
    - We want to extract keys with a certain value

Algorithm:
  - generate switches: all set to false
    - make object with keys 1-N: set to false
  - toggle switches
    - for every round between 1-N
      - toggle every switch who's switchNum % round === 0;

  - return switches that are "on"
    - switches.keys.filter(key)
      - swtiches[key] === true;
    - map to numbers
*/

function lightsOn(switchCount) {
  let lights = getLights(switchCount);
  toggleLightsInRounds(lights, switchCount);
  let lightsOn = getLightsOn(lights);
  return lightsOn; 
}

console.log(lightsOn(5)) // => [1, 4]
console.log(lightsOn(100)) // => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
console.log(lightsOn(0)) // => []



function getLights(count) {
  let lights = {};
  let i;
  for(i = 1; i <= count; i += 1) {
    lights[i] = false;
  }
  return lights;
}

function toggleLightsInRounds(lights, rounds) {
  let round;
  for (round = 1; round <= rounds; round += 1) {
    toggleLights(lights, round);
  }
}

function toggleLights(lights, round) {
  numberOfLights = Object.keys(lights).length
  for(index = round; index <= numberOfLights; index += round){
    lights[index] = !lights[index];
  }
}

function getLightsOn(lights) {
  let lightsOnKeys = Object.keys(lights).filter((lightNum) => lights[lightNum]);
  let lightsOnNumbers = lightsOnKeys.map((key) => Number(key));
  return lightsOnNumbers;
}