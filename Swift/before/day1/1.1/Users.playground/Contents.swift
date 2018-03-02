//: Playground - noun: a place where people can play

let isDebug: Bool = false

enum Gender: Int {
    case man
    case female
}

class User {
    var name: String = ""
    var gender: Gender = Gender.man
    var era: Int = 0
    var age: Int = 0
    var visits: [Int]? = nil
    
    init?(dict: [String : Any?]) {
        if dict["name"] != nil && dict["name"] is String {
            self.name = dict["name"] as! String
        }
        if dict["gender"] != nil && dict["gender"] is Gender {
            self.gender = dict["gender"] as! Gender
        }
        if dict["era"] != nil && dict["era"] is Int {
            self.era = dict["era"] as! Int
        }
        if dict["age"] != nil && dict["age"] is Int {
            self.age = dict["age"] as! Int
        }
        if dict["visits"] != nil && dict["visits"] is [Int]? {
            self.visits = dict["visits"] as! [Int]
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
