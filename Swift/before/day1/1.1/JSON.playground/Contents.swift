//: Playground - noun: a place where people can play


struct User {
    var name: String
    var gender: Int
    var era: Int
    var age: Int
    var visits: [Int]?
}

let dict: [String : Any] = ["users":[
        User(name: "Dr. Emmett Brown", gender:1, era: 1985, age: 65, visits:[1885, 1955, 1985, 2015]),
        User(name: "Marty McFly", gender:1, era: 1985, age: 17, visits:[1885, 1955, 1985, 2015]),
        User(name: "Lorraine Baines", gender:0, era: 1955, age: 18, visits:nil),
    ]
]
