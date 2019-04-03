/*
The intention of the program below is to output a paragraph.
Copy and paste the program into a JavaScript console (e.g., from the Chrome Developer Tools),
then run it. Is the output what you expected? Are there any bugs/errors? */

var paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
                ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
                dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
                ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
                diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \   
                hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

console.log(paragraph);


/* Answer ---------
There are two bugs / errors here:
1. There are trailing whitespace on line 10 after the backslash that tells JavaScript to ignore the following new line.
But the following whitespace prevents this from happening and cause a SyntaxError to raise.

2. There are white space preceeding all of the new lines in the paragraph that would result in extra
whitespace in the returned string (if an error wasn't raised in the first place).
*/