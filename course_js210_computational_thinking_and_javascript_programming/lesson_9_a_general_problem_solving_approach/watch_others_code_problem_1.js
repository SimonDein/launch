// Problem Description
// // Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages. Other than digits, the number may also contain special character such as spaces, dash, dot, and parentheses that should be ignored.

// The rules are as follows:

// If the phone number is less than 10 digits, assume that it is a bad number.
// If the phone number is 10 digits, assume that it is good.
// If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// If the phone number is is more than 11 digits, assume that it is a bad number.
// For bad numbers, just a return a string of 10 0s.

/*
Understand the Problem:
  Input: String representing a phone number

  Output: A cleaned up string of 10 digits

  Rules:
    - spaces, dot and parenthisis should be ignored
    - If the phone number is less than 10 digits, assume that it is a bad number. 
    - If the phone number is 11 digits and the first number is not 1, then it is a bad number.
    - If the phone number is is more than 11 digits, assume that it is a bad number.
      - For bad numbers, just a return a string of 10 0s.
    - If the phone number is 10 digits, assume that it is good.
    - If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.


Examples / Test Cases:
cleanPhoneNumber('0123456789') => '0123456789'
cleanPhoneNumber('01-23 45.67(89)') => '0123456789'
cleanPhoneNumber('01-23-45-67-89') => '0123456789'
cleanPhoneNumber('(01)23456789') => '0123456789'
cleanPhoneNumber('10123456789') => '0123456789'
cleanPhoneNumber('20123456789') => '0000000000'
cleanPhoneNumber('101234567899') => '0000000000'
cleanPhoneNumber('123456789') => '0000000000'
cleanPhoneNumber('101234@6789') => '0000000000'


Data Structure:
String: will provide us with regex to extrapolate the digtits as well as perform evalutation on the string as we need

Algorithm:
INVALID = '0000000000'

  - Clean up number
  - Check for length
    - if phonenumber.length > 11 || phonenumber.length < 10
      - return INVALID

    - if phonenumber.length === 11
      - if firstDigtit === 1
        - return cleaned up number
      - else
        - return INVALID;

- Return cleaned up phone number
*/ 

// function invalidPhoneNumber(number) {
//   let invalidCharacters = /[^\d. \-()]/;
//   let digits = number.match(/\d/g);

//   return digits === null ||
//          invalidCharacters.test(number) ||
//          digits.length > 11 ||
//          digits.length < 10 ||
//          digits.length === 11 && digits[0] !== '1';
// }

const DEFAULT = '0'.repeat(10);

function cleanPhoneNumber(number) {
  cleanedNumber = number.replace(/\D/g, '');
  length = cleanedNumber.length;
  
  if (length > 11 || length < 10 || length === 11 && cleanedNumber[0] === '1') {
    return DEFAULT
  }

  if (length === 11) return cleanedNumber.slice(1);
  
  return cleanedNumber;
}



// 10 digit
console.log(cleanPhoneNumber('0123456789')) //=> '0123456789'
// 10 digit containing dash, space and parenthesis
console.log(cleanPhoneNumber('01-23 45.67(89)')) //=> '0123456789'
// 10 digit only containing dashes
console.log(cleanPhoneNumber('01-23-45-67-89')) //=> '0123456789'
// 10 digit only containing parenthisis
console.log(cleanPhoneNumber('(01)23456789')) //=> '0123456789'
// 11 digit, but first digit is 1
console.log(cleanPhoneNumber('10123456789')) //=> '0123456789'
// 11 digit, but first digit is 1 and contains dash, space and parenthisis
console.log(cleanPhoneNumber('-101 234(56789)')) //=> '0123456789'
// 11 digit, but first digit is not 1
console.log(cleanPhoneNumber('20123456789')) //=> '0000000000'
// 12 digit
console.log(cleanPhoneNumber('101234567899')) //=> '0000000000'
// 9 digit
console.log(cleanPhoneNumber('123456789')) //=> '0000000000'
// empty string
console.log(cleanPhoneNumber('')) //=> '0000000000'