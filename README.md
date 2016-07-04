# Iterating Over a Dictionary

![Drawing](https://cdn.theatlantic.com/assets/media/img/mt/2016/01/solo/lead_large.jpg?1452549010)

> Never tell me the odds.

## Learning Objectives - The student should be able to...

* Retrieve values from a dictonary given a key
* Iterate over the entries (key/value pairs) in a dictionary
* Understand that dictionaries are unordered
* Recognize that a dictionary's keys need not be the same type as its values
* Recognize that types other than `String`s can be stored in a dictionary

## Recapping Dictionaries

You should recall from your previous lesson the purpose of a dictionary. In the real world, a dictionary _maps_ a word to its definition. Similarly, in the Swift world, a dictionary data structure maps a _key_ to a _value_. The keys can be of any type (although they are most commonly strings), and the values can be of any type. However, in a Swift dictionary, all keys must be of the same type (you can't have some `String` keys and some `Int` keys) and all values must be of the same type as each other (although not necessarily the same type as their keys).

When would you want to use a dictionary, though? A dictionary maps pieces of data that you _know_ (i.e., can get from the user or some other source) to pieces of information you _don't know_, just like a real-world dictionary maps a word you know to a definition you don't know (but want to know).

Here's an example of a Swift dictionary that maps an airport code to the name of its airport. Go ahead and put this in a new playground file:

```swift
let airports = [
    "YYZ": "Toronto Pearson",
    "DUB": "Dublin",
    "JFK": "John F. Kennedy International Airport",
]
```

This dictionary structure assumes that you know (or can easily obtain) an airport code. Perhaps you are writing a program for pilots, and they'll input an airport code in a text field. You can then use that known information to get another piece of information you want: The name of the corresponding airport.

## Iterating Over Dictionaries

In a real-world dictionary, words and their definitions are printed out on paper, one right after another. You can look up a specific word easily enough, or you can just read through the list. Can you accomplish the same thing with a Swift dictionary? Can you just print the keys and values one right after another, just like you can print the items in an array one right after another?

Yes, you can. A Swift `Dictionary` supports _iteration_, just like an array. When you iterate through a Swift dictionary, though, you get back both the key and value for every entry in the dictionary (unlike an array, where you just get back the item, since arrays don't have keys and values).

Imagine you want to iterate through each of the airport codes and names and print the message "The abbreviation for &lt;Airport&gt; is &lt;Code&gt>." How would you pull that off?

Given the above constant definition for `airports`, you could easily do something like this:

```swift
if let airport = airports["YYZ"] {
    print("The abbreviation for \(airport) is YYZ")
}
// prints "The abbreviation for Toronto Pearson is YYZ"

if let airport = airports["DUB"] {
    print("The abbreviation for \(airport) is DUB")
}
// prints "The abbreviation for Dublin is DUB"

if let airport = airports["JFK"] {
    print("The abbreviation for \(airport) is JFK")
}
// prints "The abbreviation for John F. Kennedy International Airport is JFK"
```

Printing out the airport names that way has a couple of drawbacks, though:

1. You're repeating the same code three times. What if your dictionary had a thousand entries? It would get pretty hard to print out all the airport names and codes like that.
2. You have to know what's already in the dictionary. What if you're reading data from an external source, like a file or database, and don't even know the exact contents of the dictionary?

You probably think that there's an easier way to do this, and you'd be right.

Remember how you used a for loop to iterate over the contents of a Swift array? You can also use a for loop to iterate over the contents of a Swift dictionary. It looks very similar to an array, but instead of getting back one item per iteration (like you do with an array), you get back two items: the _key_ and the _value_ for each entry in the dictionary. The key and the value are in the form of tuples. Remember those from the last unit? A tuple is a set of several items that can be treated as a _single value_. Dictionary iteration uses tuples to return both the key and the value for every cycle of the for loop.

Aside from the tuple issue, iterating over a dictionary looks the same as iterating over an array:

```swift
for (key, value) in airports {
    print("The abbreviation for \(key) is \(value)")
}
// prints The abbreviation for Dublin is DUB
// prints The abbreviation for Toronto Pearson is YYZ
// prints The abbreviation for John F. Kennedy International Airport is JFK
```

Since iterating over the `airports` dictionary returns a tuple containing both the key and value, you can _unpack_ that tuple in the first line of the for loop. In the example above, the dictionary's key is bound to `key` in every iteration, and the value is bound to `value`. Within the body of the for loop, `key` and `value` can be used like any other constant.

Pretty easy, right?

You don't have to use `key` and `value` to refer to the items returned in each iteration. You can use any name you want. `airportCode` and `airportName` might be more clear, in this case, so this works, too:

```swift
for (airportCode, airportName) in airports {
    print("The abbreviation for \(airportName) is \(airportCode)")
}
// prints The abbreviation for Dublin is DUB
// prints The abbreviation for Toronto Pearson is YYZ
// prints The abbreviation for John F. Kennedy International Airport is JFK
```

Iterating over dictionaries isn't much different than iterating over arrays. Did you notice something surprising about the output, though? The original dictionary you defined had a different order than the output. The original dictionary had keys in the order "YYZ", "DUB", and "JFK", but the dictionary output them in the order "DUB", "YYZ", and "JFK". This is because dictionaries are _unordered_. Unlike arrays, the order in which you put items is not necessarily the order you get them out when iterating. Sometimes you will get output in the same order, but this is not guaranteed.

## Much Ado About Dictionaries

There's nothing special at all about dictionary iteration. The dictionaries you've seen so far have been fairly simple mappings of `String`s to other `String`s. You can have fancier, more complex dictionaries, but iterating over such dictionaries is no different.

Let's illustrate this by talking about movies for a second. Are you familar with the _Toy Story_, _Star Wars_, and _Fast &amp; Furious_ film franchises? In case you're not, there are five movies in the _Toy Story_ series:

![Toy Story](https://s3.amazonaws.com/learn-verified/toy-story.png)

_Star Wars_ has nine planned movies and a TV show:

![Star Wars](https://s3.amazonaws.com/learn-verified/star-wars.png)

And _Fast &amp; Furious_ has ten movies in its universe:

![Fast &amp; Furious](https://s3.amazonaws.com/learn-verified/fast-furious.png)

(There are also 14 movies in the _Air Bud_ franchise, but don't worry about those for this lesson.)

Imagine you wanted to store this information in your program. Given a franchise name like "Star Wars", "Toy Story", or "Fast &amp; Furious", how could you store this information?

Take this one piece at a time. First, how would you store the information for each franchise?

Movie titles are obviously strings, and each franchise has several movies, so it would make sense to store these titles in an array of strings. Here's one way of storing this information:

```swift
let toyStoryFilms = [
    "Toy Story",
    "Toy Story 2",
    "Buzz Lightyear of Star Command: The Adventure Begins",
    "Toy Story 3",
    "Toy Story 4"
]

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

Since you want to be able to look up these movie titles using the name of their corresponding franchise, it would probably make sense to store the title arrays in a dictionary. But...can you do that? Can an array be the value of a key?

Absolutely! A dictionary's values can be any type, so long as all of them are of the same type. You can definitely store these arrays in a dictionary, since they're all of type `[String]` (`Array` of `String`s). Here's a dictionary that maps a franchise name to its list of films:

```swift
let movies = [
    "Star Wars": starWarsFilms,
    "Fast & Furious": fastAndFuriousFilms,
    "Toy Story": toyStoryFilms,
]
```

What is the type of `movies`? <kbd>Option</kbd>-click on `movies` to see what type it is.

![`movies` type](https://s3.amazonaws.com/learn-verified/dictionary-array.png)

`movies` is of type...`[String: [String]]`? That type signature probably looks a bit weird, since you haven't seen anything like it before, but you should be able to figure out what it means. It says that `movies` is "a `Dictionary` mapping `String` keys to `Array` of `String` values". It looks funky but it's totally valid and should make sense to you.

Can you iterate over the franchises and print the message "There are &lt;number of films&gt; in the &lt;franchise&gt; series"? Try it out in your playground!

Here's how you can iterate over the `movies` dictionary, printing "There are &lt;number of films&gt; in the &lt;franchise&gt; series" for each franchise:

```swift
for (franchise, titles) in movies {
    print("There are \(titles.count) movies in the \(franchise) series")
}
// prints There are 10 movies in the Star Wars series
// prints There are 10 movies in the Fast & Furious series
// prints There are 5 movies in the Toy Story series
```

See? Even more complicated dictionaries, like ones that contain arrays, work no differently than simple dictionaries consisting only of strings.

Try out some more examples on your own until you are comfortable with dictionaries. Soon you'll learn about even more things you can do with dictionaries in Swift.

<a href='https://learn.co/lessons/DictionaryIteration' data-visibility='hidden'>View this lesson on Learn.co</a>



