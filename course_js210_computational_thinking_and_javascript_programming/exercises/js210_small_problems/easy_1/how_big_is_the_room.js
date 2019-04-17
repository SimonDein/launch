// Build a program that asks a user for the length and width of a room in meters, and then logs to the console the area of the room in both square meters and square feet.

// Note: 1 square meter == 10.7639 square feet

// Do not worry about validating the input at this time. Use the prompt() function to collect user input.

const M2_TO_FEET2 = 10.7639;
let question_length = 'Calculate room size\nPlease enter the length of the room in meters';
let question_width = 'Please enter the width of the room in meters';

let length = Number(prompt(question_length));
let width = Number(prompt(question_width));

let square_meters = length * width;
let square_feet = square_meters * M2_TO_FEET2;

result_msg = `Room size:\nsquare meters: ${square_meters.toFixed(2)}\nsquare feet: ${square_feet.toFixed(2)}`;

alert(result_msg);
