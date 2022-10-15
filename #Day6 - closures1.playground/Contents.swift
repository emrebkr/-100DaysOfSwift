import UIKit

var greeting = "Hello, playground"


/* CREATING BASIC CLOSURES */

let driving = {
    print("I'm driving in my car")
}

driving()

/* ACCEPTING PARAMETERS IN A CLOSURE ***you don't use parameter labels when running closures*** */

let driving1 = { (place: String) in
    print("I'm going to \(place) in my car")
    
}

driving1("London")


/* RETURNING VALUES FROM A CLOSURE */

let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)



/* CLOSURES AS PARAMETERS */

let driving3 = {
    print("I'm driving in my car")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving3)

/* TRAILING CLOSURE SYNTAX */

func travel1(action1: () -> Void) {
    print("I'm getting ready to go.")
    action1()
    print("I arrived!")
}
travel1 {
    print("I'm driving in my car")
}
