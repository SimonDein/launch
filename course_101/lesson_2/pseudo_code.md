Write out pseudo-code (both casual and formal) that does the following:
  - a method that returns the sum of two integers
  - a method that takes an array of strings, and returns a string that is all those strings concatenated together
  - a method that takes an array of integers, and returns a new array with every other element


# Method one
DEFINE method(number1, number2)
  SET result = number1 + number2
  RETURN result
END-DEFINE


# Method two
DEFINE method(arr_of_strings)
  SET sentences = arr_of_strings joined together
  RETURN sentences
END-DEFINE

# Method three
DEFINE method(arr_of_ints)
  SET every_other_integer = arr_of_ints.select{every other number}
END-DEFINE
