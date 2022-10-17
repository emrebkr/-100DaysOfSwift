import UIKit

var greeting = "Hello, playground"

//Creating your own structs

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"

// Computed Properties
struct Sport1{
    var name1: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name1) is an Olympic sport"
        }
        else {
            return "\(name1) is not an Olympic sport"
        }
        
    }
}

let chessBoxing = Sport1(name1: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

/* PROPERTY OBSERVERS */

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
    
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

/* METHODS: FUNCTIONS INSIDE STRUCTS */

struct City {
    var population: Int
    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()

/* MUTATING METHODS */

struct Person2 {
    var name2: String
    mutating func makeAnonymous() {
        name2 = "Anonymous"
    }
}
var person3 = Person2(name2: "Ed")
person3.makeAnonymous()


/* PROPERTIES AND METHODS OF STRINGS */

let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

/* Properties and methods of arrays.uppercased */

var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")

print(toys.sorted())
toys.remove(at: 0)
print(toys)
