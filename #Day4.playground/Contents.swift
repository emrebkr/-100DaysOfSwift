import UIKit

var greeting = "Hello, playground"


/* FOR LOOPS */

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red","1989", "Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")
for _ in 1...5 {
    print("play")
}

/* WHILE LOOPS */

var number = 1

while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here I come!")

/* REPEAT LOOPS */

var number1 = 1

repeat {
    print(number)
    number += 1
}   while number <= 20
            
            
print("Ready or not, here I come!")
            
while false {
    print("This is false")
}
            
repeat {
    print("This is false")
} while false


/* EXITING LOOPS */

var countdown = 10

while countdown >= 0 {
    print(countdown)
    
    if countdown == 4 {
        print("I'm bored. Let's go now!")
        break
    }
    
    countdown -= 1
}
print("Blast off!")

/* EXITING MULTIPLE LOOPS */
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product).")
        
        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

/* SKIPPING ITEMS */
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    
    print(i)
}

/* INFINITE LOOPS */

var counter = 0

while true {
    print(" ----- ")
    counter += 1

    if counter == 273 {
        break
    }
}


