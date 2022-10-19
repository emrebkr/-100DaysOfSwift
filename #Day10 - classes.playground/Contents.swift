import UIKit

var greeting = "Hello, playground"


/* CREATING YOUR OWN CLASSES */

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

/* CLASS INHERITANCE */

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

/* OVERRIDING METHODS */

class Dog1 {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle1: Dog1 {
    override func makeNoise() {
        print("Yip!")
    }
}
let poppy1 = Poodle1()
poppy1.makeNoise()


/* FINAL CLASSES */

final class LastDog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

/* COPYING OBJECTS */

class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)



/* DEINITIALIZERS */

class Person3 {
    var name = "John Doe"
    
    init() {
            print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
    
}

for _ in 1...3 {
    let person = Person3()
    person.printGreeting()
}


/* MUTABILITY */

class Singer2 {
    var name = "Taylor Swift" //or let
}

let taylor = Singer2()
taylor.name = "Ed Sheeran"
print(taylor.name)
