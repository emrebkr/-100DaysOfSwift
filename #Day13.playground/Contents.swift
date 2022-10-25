import UIKit

var greeting = "Hello, playground"

/* VARS AND CONSTS */
/* TYPES OF DATA */
/* OPERATORS */

var c = 3.3
c > 4

/* STRING INTERPOLATION */

var age = 25
"You are \(age) years old. In another \(age) years you will be \(age * 2)."

/* ARRAYS */

var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
type(of: songs)

//var songs: [String] = ["Shake it Off", "You Belong with Me", "Back to December", 3]
var songs1: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]

//empty array var songs: [String] = []
var songs2 = [String]()

var song3 = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs4 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var both = songs + songs2

both += ["Everything has Changed"]

/* DICTIONARIES */

var person = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]

person["middle"]
person["month"]

/* CONDITIONAL STATEMENTS */
var action: String
var stayOutTooLate = true
var nothingInBrain = true

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}


/* LOOPS */


//If you don't need to know what number you're on, you can use an underscore instead.

var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake"
}

print(str)

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0...3 {
    print("\(people[i]) gonna \(actions[i])")
}
print("-------------------------------")
//INNER
var people1 = ["players", "haters", "heart-breakers", "fakers"]
var actions1 = ["play", "hate", "break", "fake"]

for i in 0..<people1.count {
    var str = "\(people1[i]) gonna"

    for _ in 1...5 {
        str += " \(actions1[i])"
    }

    print(str)
}

var songs10 = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs10 {
    if song == "You Belong with Me" {
        continue
    }

    print("My favorite song is \(song)")
}


/* SWITCH CASE */




