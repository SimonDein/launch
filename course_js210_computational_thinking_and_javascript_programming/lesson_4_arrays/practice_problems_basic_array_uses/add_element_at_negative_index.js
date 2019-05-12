// Can we insert data into an array at a negative index? If so, why is this possible?

/*
Yes we can due the all arrays being an object. The added elements become a array object,
but isn't properly part of the arrray elements.
*/

/*
> arr = [1, 2]
[ 1, 2 ]
> arr[-2] = 4
4
> arr
[ 1, 2, '-2': 4 ]
> arr.length
2
> arr[2]
undefined
*/