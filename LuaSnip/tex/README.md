# Goals
1. Find conflicting snippets

# Symbols
1. Any snippet that is a standalone; having no meaning without context

e.g tilde would not be a symbol as it requires an argument
1. Contains no insert nodes

# Maps
1. Any snippet for well defined maps, where it is clear we are interested in the map. For example the snippet that expand ee to e^{i(i)} is a map exp(x) -> e^x
however given the context we are not explicitly interested in the map but rather only interested in placing x above e efficiently. An example of a map would be a trig function.
e.g dot is not a map since we need context to determine its meaning as dot product

1. Must contain no insert nodes

# Syntax
1. Any snippets used to efficiently place symbols or relating to mathematical syntax. We also include any snippets which 
relate to a property of an object such as rank or nullity.

e.g diag(x_1, x_2,...) would be considered a syntax snippet as it is shorthand syntax for
the matrix with entries on diagonal. While Im(A) would be a map since it is not a property of A but rather a map from A
to its imaginary part

# Env
1. Any snippets corresponding to structure of document, unrelated to the semantics of the latex


# Notes
* `[]` define character class
* `()` to create capture group
* `[^...]` negation
* `[%a%p]` punctuation or alphabetic character class

## Character classes
* `%a` alphabetic characters (A-Z), (a-z)
* `%w` words (A-Z), (a-z), (0-9), _
* `%l` lower case letters (A-Z)
* `%u` upper case letters (A-Z)
* `%s` space characters
* `%p` punctuation . , ! ? : ;
* `%x` hexadecimal (A-F) (0-9) (a-f)
* `%z` null character

## Characters that must be escaped
To match any of the following prefix with `%`
* `\` 
* `%` escape character
* `*` matches zero or more occurrences of preceding character
* `-` matches zero or more occurrences of preceding character.
      Used to specify range inside `[]`
* `?` matches zero or one occurrence of preceding character
* `[`
* `]` 
* `^` matches start of string. Used inside `[]` for negation
* `$` matches the end of string
* `|` logical OR
* `(`
* `)`
* `.` matches any char except newline
* `+` matches one or more of preceding character



# TODO
1. Dynamic creation of lists
1. Itegrals
1. Product
1. bounds
1. Get expandable snippets working with live preview window

1. Make function to get character under cursor and remove
1. Fix integral and ? snippets


1. Figure out how to center equation in middle of page
1. For sums and products create individual snippets, then include easy methods for creating limitss
