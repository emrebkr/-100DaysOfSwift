import UIKit

var greeting = "Hello, playground"


/* WRITING FUNCTIONS */
func printHelp() {
let message = """
Welcome to MyApp!
    
Run this app inside a directory of images and MyApp will resize them all into thumbnails
"""

    print(message)
}
printHelp()

/* ACCEPTING PARAMETERS */
print("Hello, world!")

func square(number: Int){
    print(number * number)
}

square(number: 8)

/* RETURNING VALUES */

func square1(number: Int) -> Int {
    return number * number
}

let result = square1(number: 8)
print(result)

/* PARAMETER LABELS */

func square2(number2: Int) -> Int {
    return number2 * number2
}
let result2 = square2(number2: 8)

func sayHello(to name: String){
    print("Hello, \(name)!")
}
sayHello(to: "Andrew")



/* OMITTING PARAMETER LABELS */

func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Bob")

/* DEFAULT PARAMETERS */

func greeting(_ person: String, nicely: Bool = true){
    if nicely == true {
        print("Hello, \(person)!")
    }   else {
        print("Oh no, it's \(person) again...")
    }
}

greeting("Taylor")
greeting("Taylor", nicely: false)

/* VARIADIC FUNCTIONS */

func variadicsquare(numbers: Int...){
    for num in numbers{
        print("\(num) squared is \(num * num)")
    }
}

variadicsquare(numbers: 1,2,3,4,5)


/* WRITING THROWING FUNCTIONS */
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}


/* RUNNING THROWING FUNCTIONS */
do {
    try checkPassword("password")
    print("That password is good!")
}   catch {
    print("You can't use that password.")
}


/* INOUT PARAMETERS */
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
print(myNum)
