// In the following code, what are the final length values for array1, array2, array3, array4, and array5?

let array1 = [1, 2, undefined, 4]; // 4

let array2 = [1];
array2.length = 5; // 5 as we expand the array. The new indexes will be assigned to a value of undefined

let array3 = [];
array3[-1] = [1]; // 0 - we added a property to the array not a real element.

let array4 = [1, 2, 3, 4, 5];
array4.length = 3; // 3 - the array is truncated; cut to a new length of 3.

let array5 = [];
array5[100] = 3; // 101. every index up til 100 will be empty.