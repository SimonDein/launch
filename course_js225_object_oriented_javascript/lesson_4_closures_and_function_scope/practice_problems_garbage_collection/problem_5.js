// Consider the script below:

var bash = "Some val";
// Will the value "Some val" ever be eligible for garbage collection?

/*
ANSWER

Maybe. That depends on whether a reference to "Some val" is kept or not. If we reassign bash to fx. true -
"Some val" would be eligable for GC there no longer is any reference to it. Otherwise when the script finishes running.
*/