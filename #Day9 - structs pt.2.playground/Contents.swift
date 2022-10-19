import UIKit

var greeting = "Hello, playground"


/* INITIALIZERS */

struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
        
    }
}

var user = User()
user.username = "twostraws"


/* REFERRING TO THE CURRENT INSTANCE */

struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

/* LAZY PROPERTIES */

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person1 {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}
var ed = Person1(name: "Ed")
ed.familyTree

/* STATIC PROPERTIES AND METHODS */

struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
let ed1 = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(Student.classSize)


/* ACCESS CONTROL */

struct Person2 {
    private var id: String
    
    init(id: String){
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let ed2 = Person2(id: "12345")

