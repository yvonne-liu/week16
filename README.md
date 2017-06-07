# week16

elm-live README —> sets up live server and watches your files for changes (like browser sync)

```
import Html exposing (..)

import Html.Attributes
```

no returns, no semi colons, no break

no parenthesis after if statements

if statements must always have an else statement

after an if statement, you need a then

An if statement should follow this pattern

```
pluralise singular plural quantity =

if quantity = 1 then
	singular
else
	plural

quantity === 1 ? singular : plural
```


no triple equals

`+` is for adding numbers; `++` is for concatenating strings

the arguments of a function don’t have to be put in parens —> they are just words separated by spaces after the name of a function

##### Let expression

```
pluralise singular plural quantity =
  let
    quantityStr =
      toString quantityStr

    prefix =
      quantityStr ++ " "
  in
    if quantity == 1 then
        prefix ++ singular
    else
        prefix ++ plural

```

Collections of data
record
Object with equals instead of colons
tuple
list



```
  tuple =
      ( "thing", 1, 3 )

```

Tuple destructuring

```

  ( name, x, y ) =
      ( "thing", 1, 3 )
```

List looks like an array
All lists must contain items with a common type
