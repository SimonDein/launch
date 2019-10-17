// In our previous solution, multiplyBy5 retains access to func and b long after makePartialFunc has finished execution. What makes this possible?


/*
ANSWER

because the function returned by makePartialFunc is a closure and "closes over" the variables in in it's
scope even after it is returned.
*/