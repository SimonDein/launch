// Finally, write a function named formatTime that takes a date object as an argument and returns a string formatted with the hours and minutes as "15:30". Make sure you handle the case where the hours or minutes has only one digit: you need to pad the value with a leading zero in such cases, e.g., "03:04".

function formatTime(date) {
  let minutes = String(date.getMinutes());
  let hours = String(date.getHours());
  
  return `${hours.padStart(2, '0')}:${minutes.padStart(2, '0')}`;
}

let today = new Date();
console.log(formatTime(today)); // 20:11