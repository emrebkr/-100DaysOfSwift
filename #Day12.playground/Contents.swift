import UIKit

var greeting = "Hello, playground"

/* HANDLING MISSING DATA */

var age: Int? = nil
age = 38

/* UNWRAPPING OPTIONALS */

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

/* UNWRAPPING WITH GUARD */

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}


/* FORCE UNWRAPPING */

let str = "5"
let num = Int(str)!


/* IMPLICITLY UNWRAPPED OPTIONALS */

let age1: Int! = nil

/* NIL COALESCING */

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"


/* OPTIONAL CHAINING */

let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()

/* OPTIONAL TRY */

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")

/* FAILABLE INITIALIZERS */

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

/* TYPECASTING */

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
