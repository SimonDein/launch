// Given a string that consists of some words and an assortment of non-alphabetic characters, write a function that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (i.e., the result string should never have consecutive spaces).



function cleanUp(string) {
  let cleanText = '';
  let insertedSpace = false;
  
  for(let i = 0; i < string.length; i++) {
    if (string[i].match(/[a-zA-Z]/)) {
      cleanText += string[i];
      insertedSpace = false;
    } else {
      if(insertedSpace) {
        continue;
      } else {
        cleanText += ' ';
        insertedSpace = true;
      }
    }
  }

  return cleanText;
}

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "