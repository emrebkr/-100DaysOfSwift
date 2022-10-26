/* FUNCTIONS */

func countLettersInString(_ str: String) {
    print("The string \(str) has \(str.count) letters.")
}
countLettersInString("Hello")

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}
countLetters(in: "Hello")


func albumIsTaylors(name: String) -> Bool {
    if name == "Taylor Swift" {return true}
    if name == "Fearless" {return true}
    return false
}

if albumIsTaylors(name: "Taylor Swift") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

if albumIsTaylors(name: "The White Album") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}


/* OPTIONALS */

func getHaterStatus() -> String? {
    return "Hate"
}

func getHaterStatus1(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}
getHaterStatus1(weather: "sunny")
getHaterStatus1(weather: "stormy")

var status: String?
status = getHaterStatus1(weather: "rainy")
var status1 = getHaterStatus1(weather: "rainy")


if let unwrappedStatus = status {
    // unwrappedStatus contains a non-optional value!
} else {
    // in case you want an else block, here you go…
}

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

/*
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}
*/

func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    //return 0 is a mistake, year 0 ? or doesn't exist, clarify.
    return nil
}

yearAlbumReleased(name: "Lantern")



/* OPTIONAL CHAINING */

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

let album = albumReleased(year: 2006)
print("The album is \(album)")


let str = "Hello world"
print(str.uppercased())

let album1 = albumReleased(year: 2006)?.uppercased()
print("The album is \(album1)")

//let album = albumReleased(year: 2006)?.someOptionalValue?.someOtherOptionalValue?.whatever


//Nil coalescing operator

let album2 = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album2)")



/* ENUMERATIONS */

enum WeatherType {
    //case sun, cloud, rain, wind, snow
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}
func getHaterStatus3(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getHaterStatus3(weather: WeatherType.wind(speed: 5))


//none some
func knockKnock(_ caller: String?) {
    print("Who's there?")
    
    switch caller {
    case .none:
        print("* silence *")
    case .some(let person):
        print(person)
    }
}
knockKnock(nil)
knockKnock("Orange")




/* STRUCTS */

struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
           print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
print(taylor.clothes)
print(other.shoes)

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)

taylor.describe()


/* CLASSES
 You don't get an automatic memberwise initializer for your classes; you need to write your own.
 You can define a class as being based off another class, adding any new things you want.
 When you create an instance of a class it’s called an object. If you copy that object, both copies point at the same data by default – change one, and the copy changes too.
 */
/*
class Person {
    var clothes: String
    var shoes: String
}
 */
//There are three solutions: make the two values optional strings, give them default values, or write our own initializer.


class Person1 {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

class Singer {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func sing() {
        print("La la la la")
    }
}

var taylor1 = Singer(name: "Taylor", age: 25)
taylor1.name
taylor1.age
taylor1.sing()

class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars, and liquor")
    }
}

var taylor2 = CountrySinger(name: "Taylor", age: 25)
taylor2.sing()


class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String,age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)//"call a method on the class I inherited from"
    }
    override func sing(){
        print("Grrrrr rargh rargh rarrrrgh!")
    }
}
