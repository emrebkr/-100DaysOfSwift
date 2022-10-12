import UIKit

var greeting = "Hello, playground"

/* ARRAYS */
let john = "John Lennon"
let paul  = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"
let beatles = [john, paul, george, ringo]
beatles[1]
var scores: [Int] = [1,2,3,4]

/*SETS */
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])


/*TUPLES*/
var name = (first: "Taylor",last: "Swift")
name.0
name.first
name.last


let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
let set = Set(["aardvark", "astronaut", "azalea"])
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

/**DICTIONARIES*/
let heights = [
    "Taylor Swift" : 1.78,
    "Ed Sheeran" : 1.73
]
heights["Taylor Swift"]

/* DICTIONARY DEFAULT VALUES*/

let favoriteIceCream = [
    "Paul" : "Chocolate",
    "Sophie" : "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Max", default:"Kido"]


/* CREATING EMPTY COLLECTIONS */
var teams = [String: String]()
teams["Paul"] = "Red"

var results = [Int]()
var words = Set<String>()
var numbers = Set<Int>()
var scores1 = Dictionary<String, Int>()
var results1 = Array<Int>()

/* ENUMERATIONS */

let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure

/* ENUM ASSOCIATED VALUES */

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "Football1")
talking

/* ENUM RAW VALUES*/

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)
earth

