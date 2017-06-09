# week16

## elm-live
elm-live README —> sets up live server and watches your files for changes (like browser sync)

```
import Html exposing (..)

import Html.Attributes
```

## syntax
* no returns, no semi colons, no break
* no parenthesis after `if` statements
* `if` statements must always have an else statement
* after an `if` statement, you need a `then`
* no triple equals
* `+` is for adding numbers; `++` is for concatenating strings
* the arguments of a function don’t have to be put in parens —> they are just words separated by spaces after the name of a function

An `if` statement should follow this pattern

```
pluralise singular plural quantity =

if quantity = 1 then
	singular
else
	plural

quantity === 1 ? singular : plural
```


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


elm does not have break clauses or return statements

3 types of collections (most common):
records
 * similar to a js object
 * no concept of inheritance, methods or local state. They are DUMB! They don't do anything but hold data
 * fixed length
 * mixed contents

`record = {name = "thing", x=1, y=3}`
 tuple
 * shorthand for a record when you don't want to name
 * position dictates where it goes
 * fixed length
 * mixed contents

 `tuple =
 ("thing", 1, 3)`

 Then we use tuple destructuring to pull them out again and give them names

 ` (name, x, y) = ( "thing, 1, 3")`

 Note: if your tuples are getting too long and hard to remember - it's probably time for a record.

Lists
Rule: all lists must contain elements that contain a common types

Why? because it's not safe to mix types when running over collections (NaN-poisoning ;))

* variable length (can add and remove from them)
* uniform contents (no mixing)


## 3. Adding interaction

## Booleans
* True
* False

x == y
not (x == y)
x /= y [not equal to]

There is no truthiness, only booleans. You cannot give it a number or a string.

## partial application
Found this confusing
<!-- Elm supports partial application by default.

What happens if you're missing an argument?

Gives you back a function,   -->

##

Anonymous functions:

elm: (\foo -> foo + 1)
js: (function(foo) { return foo + 1 })

Anonymous vs named function example:

Named:
```
isKeepable num = num >= 2
List.filter isKeepable [ 1, 2, 3 ]
== [ 2, 3 ]
```


Anonymous:
```
List.filter (\num -> num >= 2) [ 1, 2, 3]
== [ 2, 3 ]
```



## Elm Architecture
Model View Update
In Elm, this architecture 'is not a suggestion, this is the foundation of all of your elm programmes'... 'this is not opt-in'.

### Changing the view:
We use the same function every single time, but what is shown depends on the model we pass to it

update - Model - view

```
{ operation = "SHOW_MORE", data = 10 }
update msg model =
    if msg.operation == "SHOW_MORE" then
        { maxResults = model.maxResults + msg.data }
    else
        model
```

This wouldn't scale so well (because it assumes that our model has exactly one field in it and no more)

Solution: RECORD UPDATE SYNTAX
```
update msg model =
if msg.operation == "SHOW_MORE" then
{
  model | maxResults = model.maxResults + msg.data }
  else
  model
```

we have to decide under which circumstances we want messages to get sent
msg (messages are our currency for making interactions happen  )


## Interactivity
```
button
[ onClick { operation = "SHOW_MORE", data = 10 } ]
[ text "Show More"]

```
click handler + msg. Means 'when user clicks on this element send this msg to the update function along with the current model '

Don't have to worry about adding and removing event listeners (elm runtime does this for you)


## Exercise 3
If something doesn't have a dependency - it doesn't need to be in a let. In fact, you **should** pull them out to the top level, because that makes it clear that they don't have any dependencies. The only scope that it needs is the top level.

## Type annotations
* benefit: don't get out of date

```
query: string
query = "tutorial"
```
The compiler will verify the accuracy of these

I can give more complex type annotations and alias (a way to refer to it and make it reusable)

that confusing -> syntax is function annotation

```
update: Msg -> Model -> Model
```

Gets funky when you have nested functions :(

  <function> : String -> String -> Int -> String
  A function which takes a string and returns a function which takes a string and an integer and returns a string

  Difference between the words partial application a currying and why that might be?

  Can use synonymously?

  Currying just means that your functions are set up to support partial application. Oh I want to 'partially apply this function'




  # Testing

  directory structure:
  elmHub/
    elm-package.json
    Main.elm
    elmHub.elm

    <!-- create sub directory for tests -->
    tests/
      elm-package.json
      Main.elm
      Tests.elm

difference?
* tests/elm-package.json will have additional dependencies. The stuff we need to run our tests should not be in the production env

* Main.elm will not run our application but rather our tests

* Tests - main will import to describe the tests we want to run.

Install elm-test:
npm install -g elm-test

Then the init command should set up everything for you:
elm test init

And just like that, you are ready to run the tests:
elm test
