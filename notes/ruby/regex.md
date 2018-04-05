# Regular Expressions 

##### About Regex

> A regular expression (regex) is a pattern we can use to search for information of interest in a string or set of strings - basically a text.

A regular expression can consist of several "patterns" that together comprise an expression.

Regex is not unique to Ruby, or any other language for that matter, but is a **concept** developed in the 50'ies and have since got support by most programming languages, built-in or by libraries.



A Regex is defined by to slashes containing a pattern `/*pattern/`

#### Literal Matching

`/abc/` is matching litarally the letter `a` followed literally the letter `b` then `c`





### Regex

###### Pattern

A regex, also a pattern, typically consist of contatenation of sub-patterns.

The regex `/ca/` consists of two subpatterns - a literal match of `c` followed by the literally the letter `a`.

###### Literal match

`/cat/` - `a`, followed by `b`, followed by `c`

###### Character Class and Short Cuts

> any big letter version of a shortcut means the oppesite of the lowercase version

`/[abc]/` - `a` or `b` or `c`

`/\w/` - any word character (letter, number or underscore) - equals to `/[a-z0-9_]/i`

`/\d/` - any digit - equals to `/[0-9]/`

`/./` - any single character whatsoever

`/\s/` - any whitespace character - equals to `/ \t\n\v\r/` (notice the space at the start)

###### Alternation

* ` /(a|b)/`

###### Anchors

* `/^cat/` - cat at the start of line
* `/fish$/` - fish at the end of line
* `/\b/` - word boundary

###### Quantifiers

* `?` - zero or one (This is used for optional characters in a string. Maybe you need to match both color and colour)
* `*` - zero or more
* `+` one or more
* `{2}`, `{2,3}`, `{,3}` - 2, 2 up to 3, zero up to 3

###### Options / flags

* `/*regex/i` - pattern is case-insensitive

​	