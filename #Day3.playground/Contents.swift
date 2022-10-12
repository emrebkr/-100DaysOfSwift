import UIKit

var greeting = "Hello, playground"


/* ARITHMETIC OPERATORS*/

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

/* OPERATOR OVERLOADING*/

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Faker gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

/* COMPOUND ASSIGNMENT OPERATORS */

var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

/* COMPARISON OPERATORS */

let firstScore1 = 6
let secondScore1 = 4

firstScore1 == secondScore1
firstScore1 != secondScore1
firstScore1 < secondScore1
firstScore1 >= secondScore1

"Taylor" <= "Swift"

/* CONDITIONS*/

let firstCard = 11
let secondCard = 10


if firstCard + secondCard == 2{
    print("Aces A lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
print("Regular cards")
}

/* COMBINING CONDITIONS */

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}
if age1 > 18 || age2 > 18 {
    print("One of them is over 18")
}

/* THE TERNARY OPERATOR wtf swift look like python*/
let firstCard1 = 11
let secondCard1 = 10
print(firstCard1 == secondCard1 ? "Cards are the same" : "Cards are different")

if firstCard1 == secondCard1 {
    print("Cards are the same")
} else {
    print("Cards are different")
}

/* SWITCH STATEMENTS */

let weather = "sunny"

switch weather {
    case "rain":
        print("Bring an umbrella")
    case "snow":
        print("Wrap up warm")
    case "sunny":
        print("Wear sunscreen")
        fallthrough /*IF YOU WANT TO CONTINUE ON THE NEXT ONES*/
    default:
        print("Enjoy your day!")
}


/* RANGE OPERATORS ***** ... ..< */

let score1 = 85

switch score1 {
    case 0..<50:
        print("You failed badly.")
    case 50..<85:
        print("You did OK.")
    default:
        print("You did great!")
}
let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[0])
print(names[1...2])
print(names[1...])

let tvShow = "Breaking " + "Bad"
