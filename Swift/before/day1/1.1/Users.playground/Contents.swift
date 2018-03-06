//: Playground - noun: a place where people can play

let isDebug: Bool = false

enum Gender: Int {
    case man
    case female
}

class User {
    var name: String = ""
    var gender: Gender = .man
    var era: Int = 0
    var age: Int = 0
    var visits: [Int]? = nil
    
    init?(dict: [String : Any?]) {
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let gender = dict["gender"] as? Gender {
            self.gender = gender
        }
        if let era = dict["era"] as? Int {
            self.era = era
        }
        if let age = dict["age"] as? Int {
            self.age = age
        }
        if let visits = dict["visits"] as? [Int] {
            self.visits = visits
        }
        
        if (isDebug) {
            showInfo()
        }
    }
    
    func showInfo() {
        print(self.name)
        print(self.gender)
        print(self.era)
        print(self.age)
        print(self.visits ?? "")
    }
}

let users: [User] = [
    User(dict: ["name":"Dr. Emmett Brown", "gender":Gender.female, "era":1985, "age":65, "visits":[1885, 1955, 1985, 2015]])!,
    User(dict: ["name":"Marty McFly", "gender":Gender.female, "era":1985, "age":17, "visits":[1885, 1955, 1985, 2015]])!,
    User(dict: ["name":"Lorraine Baines", "era":1985, "age":17])!,
]
print(users)

let dict: [String : [User]] = ["users":users]
print(dict)
