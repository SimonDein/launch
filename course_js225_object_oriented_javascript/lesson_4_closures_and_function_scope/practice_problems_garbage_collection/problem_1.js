// Is JavaScript a garbage-collected language, and if so, what does this entail?

/*
ANSWER

Yes. It means that at run time the engine will free up allocated memory that is determined to "no longer needed".
Different algorithms will determine when something should be GC differently.
Mark-and-sweep is the type of algorithm implemented by all modern browsers today and will GC when an object is no longer reachable.
*/