import Cocoa

var greeting = "Hello, playground"

// Default Values for parameters in functions

func timeTable(for number: Int, upto limit: Int = 10) { // Giving default value of 10 to table
    for i in 1...limit {
        print("\(number) times \(i) is \(number * limit)")
    }
}

timeTable(for: 5, upto: 12)
print("\nTable of 12 is:")
timeTable(for: 12, upto: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true) // Keep capacity keep space for 4 items in the memory // Optimising tool
print(characters.count)

var items: InlineArray<4, String> = ["1", "2", "3", "4"] // Array of 4 string items // swift 6.2 method

func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // code here
}

findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)


// Handling Errors // In functions

enum PasswordError: Error {
    case short, obvious
}

func passwordCheck(enter password: String) throws -> String { // All error throwing functions should throw errors // Can throw not must throw
    if password.count <= 5 { throw PasswordError.short }
    if password == "password" { throw PasswordError.obvious }
        
    if password.count <= 8 {
        return "OK"
    } else if password.count < 10 {
        return "Great"
    } else {
        return "Excellent"
    }
}

//print(try passwordCheck(enter: "1234")) // All functions that can throw error must be called using try keyword
// do catch block is important

do {
    let result = try passwordCheck(enter: "1234")
    print("Password Rating: \(result)")
} catch {
    print("There was an error, handle error here") // If any error happens then do block will end and go to catch block
}

// avoid using try! - can crash app

// Custom Error Handling // Specific Error handling
do {
    let result = try passwordCheck(enter: "1234")
    print("Password Rating: \(result)")
} catch PasswordError.short {
    print("Error: Short password")
} catch PasswordError.obvious {
    print("Error: Obvious password")
} catch {
    print("There was an general error")
    print("\(error.localizedDescription)")
}


// More Examples of throw functions

enum PlayError: Error {
    case cheating
    case noPlayers
}
func playGame(name: String, cheat: Bool = false) throws {
    if cheat {
        throw PlayError.cheating
    } else {
        print("Let's play a game of \(name)...")
    }
}



enum PizzaErrors: Error {
    case hasPineapple
}
func makePizza(type: String) throws {
    if type != "Hawaiian" {
        print("Your pizza will be ready in 10 minutes.")
    } else {
        throw PizzaErrors.hasPineapple
    }
}




enum BookErrors: Error {
    case tooFewPages
    case tooManyPages
}
func writeBook(title: String, pages: Int) throws {
    switch pages {
    case 0...50:
        throw BookErrors.tooFewPages
    case 51...400:
        print("Perfect! I'm going to write \(title)...")
    default:
        throw BookErrors.tooManyPages
    }
}



enum ChargeError: Error {
    case noCable
    case noPower
}
func chargePhone(atHome: Bool) throws {
    if atHome {
        print("Phone is charging...")
    } else {
        throw ChargeError.noPower
    }
}


enum ArrayError: Error {
    case negateIndex
}
func readItem(_ index: Int, from array: [String]) throws -> String {
    if index < 0 {
        throw ArrayError.negateIndex
    }
    return array[index]
}
