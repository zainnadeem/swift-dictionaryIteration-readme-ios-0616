# Iterating Over a Dictionary

![Drawing](https://cdn.theatlantic.com/assets/media/img/mt/2016/01/solo/lead_large.jpg?1452549010)

> Never tell me the odds.

## Learning Objectives - The student should be able to...

* See the outline/notes. 
* If you can, please fill this out when you're complete with this lesson as you will get a better sense at what to put here after the lesson is complete.

## What the student can do at this point 

* Create variables and constants
* Is familiar with type annotations, type inference and string interpolation.
* Can create functions with return types.
* Is familiar with the String, Int, Double, and Bool type.
* Can perform arithmetic operations on Int and Double.
* Understands if and else clause statements.
* Can create and use Arrays.
* Can iterate over an Array using a for-in loop.
* Can iterate over an Array calling enumerate().
* Work with the following methods on arrays:
	* append()
	* insert(_:atIndex:)
	* removeAtIndex()
	* subscript syntax with arrays
	* count
	* isEmpty
	* Optionals
	* Just learned about dictionaries
## Outline / Notes

*  Reiterate what it is that the problem a dictionary is solving. A dictionary stores associates between keys and values with no defined ordering.
* Go into explaining that the type of keys is `String` and values are of type `String` as well:

```swift
let airports = [
    "YYZ": "Toronto Pearson",
    "DUB": "Dublin",
    "JFK": "John F. Kennedy International Airport"
]
```

* What if we wanted to iterate over this... printing out to the console a sentence as follows "The abbreviation for the X airport is Y." X represents the name of the airport (i.e. Toronto Pearson) and Y represents the abbreviation (YYZ) except we want to print out all three separately.
* Well... we can do this one at a time as we know that we can retrieve the value with a key and store that into a variable like so (what we had just learned):

```swift
let airports = [
    "YYZ": "Toronto Pearson",
    "DUB": "Dublin",
    "JFK": "John F. Kennedy International"
]

if let torontoAirport = airports["YYZ"] {
    print("The abbreviation for the \(torontoAirport) airport is YYZ")
}
// prints "The abbreviation for the Toronto Pearson airport is YYZ"


if let dublinAirport = airports["DUB"] {
    print("The abbreviation for the \(dublinAirport) airport is DUB")
}
// prints "The abbreviation for the Dublin airport is DUB"


if let newyorkAirport = airports["JFK"] {
    print("The abbreviation for the \(newyorkAirport) airport is JFK")
}
// prints "The abbreviation for the John F. Kennedy International airport is JFK"
```

* Here we have to check to see that we are in fact receiving a value at that specific key we're supplying because it returns back an Optional (because there might NOT be a value with the supplied key). So we have to use optional binding (`if let`) to check to see if there is in fact an underlying value in that optional which we THEN could use within the scope of our `if let`.

* Clearly... there must be a better way!

* Follow me...

![follow me](https://media.giphy.com/media/lSiXzuSOSQgQE/giphy.gif)

```swift
for (key, value) in airports {
    print("The abbreviation for the \(value) is \(key)")
}

// prints "The abbreviation for the Dublin is DUB"
// prints "The abbreviation for the Toronto Pearson is YYZ"
// prints "The abbreviation for the John F. Kennedy International is JFK"
```

* Step through exactly what's going on here. At this point, they should know what a tuple is... but briefly cover it again. Either way, I also want them to know they could name those whatever they want.. however it fits their problem at hand:

```swift
for (airportCode, airportName) in airports {
    print("The abbreviation for the \(airportName) is \(airportCode)")
}

// prints "The abbreviation for the Dublin is DUB"
// prints "The abbreviation for the Toronto Pearson is YYZ"
// prints "The abbreviation for the John F. Kennedy International is JFK"
```

* No difference from the one above.
* Go over the definition of `for in` again with the student here. They will have seen it only once before at this point in relation to Arrays.

* I want them to be able to work with an array as a value for keys like such:

* Toy Story:

![toyStory](http://i.imgur.com/0uIxPHG.png?1)

* Star Wars:

![Star Wars](http://i.imgur.com/vBqVDby.png?1)

* Fast & Furious:

![Fast](http://i.imgur.com/PsOjNKQ.png?1)

* If we want to store these films in a collection, ask the student in a question what format would work best..... we would create arrays like such:

```swift
// an array of type [String] representing Toy Story Films
let toyStoryFilms = [
    "Toy Story",
    "Toy Story 2",
    "Buzz Lightyear of Star Command: The Adventure Begins",
    "Toy Story 3",
    "Toy Story 4"
]

// an array of type [String] representing Star Wars Films
let starWarsFilms = [
    "Star Wars",
    "The Empire Strikes Back",
    "Star Wars: Episode VI",
    "Star Wars: Episode I",
    "Star Wars: Episode II",
    "Star Wars: Episode III",
    "Star Wars: The Clone Wars",
    "Star Wars: The Force Awakens",
    "Star Wars: Episode VIII",
    "Star Wars: Episode IX"
]

// an array of type [String] representing Fast & Furious Films
let fastAndFuriousFilms = [
    "The Fast and the Furious",
    "2 Fast 2 Furious",
    "Turbo-Charged Prelud",
    "Tokyo Drift",
    "Fast & Furious",
    "Los Bandoleros",
    "Fast Five",
    "Fast & Furious 6",
    "Furious 7",
    "Fast 8"
]
```

* There's NOTHING stopping you from being able to use these arrays as values in creating a dictionary, you've become very familiar with creating dictoinaries of this type `[String: String]` but we... can also create a dictionary of this type.. `[String: [String]]` <--- this type signature might freak them out.

```swift
var movies = [
    "Toy Story": toyStoryFilms,
    "Star Wars": starWarsFilms,
    "The Fast and the Furious": fastAndFuriousFilms
]
```

![type](http://i.imgur.com/jZvO4ui.png?1)

```swift
for (movieTitle, films) in movies {
    print("There have been \(films.count) films made in the \(movieTitle) series.")
}

// prints "There have been 5 films made in the Toy Story series."
// prints "There have been 10 films made in the Star Wars series."
// prints "There have been 10 films made in the The Fast and the Furious series."
```

```swift
var movies = [
    "Toy Story": toyStoryFilms,
    "Star Wars": starWarsFilms,
    "The Fast and the Furious": fastAndFuriousFilms
]


for (movieTitle, films) in movies {
    print("\(movieTitle)")
    print("------------")
    print("\(films)\n\n")
}

// prints the following: 

//Toy Story
//    ------------
//    ["Toy Story", "Toy Story 2", "Buzz Lightyear of Star Command: The Adventure Begins", "Toy Story 3", "Toy Story 4"]


//Star Wars
//    ------------
//    ["Star Wars", "The Empire Strikes Back", "Star Wars: Episode VI", "Star Wars: Episode I", "Star Wars: Episode II", "Star Wars: Episode III", "Star Wars: The Clone Wars", "Star Wars: The Force Awakens", "Star Wars: Episode VIII", "Star Wars: Episode IX"]


//The Fast and the Furious
//    ------------
//    ["The Fast and the Furious", "2 Fast 2 Furious", "Turbo-Charged Prelud", "Tokyo Drift", "Fast & Furious", "Los Bandoleros", "Fast Five", "Fast & Furious 6", "Furious 7", "Fast 8"]
```
<a href='https://learn.co/lessons/DictionaryIteration' data-visibility='hidden'>View this lesson on Learn.co</a>



