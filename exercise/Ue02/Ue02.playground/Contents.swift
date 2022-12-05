import Cocoa

enum FriendshipError: Error {
    case personAlreadyAdded
    case personCantBeFriendWithItself
    case friendOrPersonDoesNotExist
}

class Person: Hashable {
    
    var name: String
    
    init(name: String) {
        print("init \(name)")
        self.name = name
    }
    
    deinit {
        print("deinit \(name)")
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}

class FriendshipManager {
    
    var friendships: [Person: [Person]] = [:]
    
    func addFriendship(of: Person, with: Person) throws {
        
        if(of == with) {
            throw FriendshipError.personCantBeFriendWithItself
        }
        
        if(friendships[of]?.contains(with) ?? false) {
            throw FriendshipError.personAlreadyAdded
        }
        
        if(friendships.contains{ $0.key == of }) {
            friendships[of]!.append(with)
        } else {
            friendships[of] = [with]
        }
    }
    
    func friendCount(of: Person) -> Int {
        return friendships[of]?.count ?? 0
    }
    
    func removeFriend(of: Person, with: Person) throws {
        if(!(friendships[of]?.contains(with) ?? false)) {
            throw FriendshipError.friendOrPersonDoesNotExist
        }
        
        friendships[of]!.removeAll(where: {$0.name == with.name})
    }
    
    func outputFriendsOfPerson(p: Person, sort: (Person, Person) -> Bool) {
        
        if(friendships.contains{ $0.key == p }) {
            var description = "[ "
            for friend in friendships[p]!.sorted(by: sort) {
                description += friend.name + " "
            }
            description += "]"
            
            print(description)
            
        } else {
            print("No friends :(")
        }
    }
    
    class func test() {
        
        do {
            let person1 = Person(name: "Andreas")
            let person2 = Person(name: "Patrick")
            let person3 = Person(name: "Florian")
            let person4 = Person(name: "Thomas")
            let person5 = Person(name: "Zeti")
            
            let manager = FriendshipManager()
            // Andreas & friends
            try manager.addFriendship(of: person1, with: person2)
            try manager.addFriendship(of: person1, with: person3)
            try manager.addFriendship(of: person1, with: person4)
            try manager.addFriendship(of: person1, with: person5)
            // Thomas & friends
            try manager.addFriendship(of: person4, with: person3)
            try manager.addFriendship(of: person4, with: person5)
            try manager.addFriendship(of: person4, with: person1)
            try manager.removeFriend(of: person4, with: person1)
 
            print(person1.name)
            manager.outputFriendsOfPerson(p: person1, sort: namesAsc)
            print(person4.name)
            manager.outputFriendsOfPerson(p: person4, sort: friendCountAsc)
            
            func namesAsc(p1: Person, p2: Person) -> Bool {
                return p1.name < p2.name
            }
            
            func friendCountAsc(p1: Person, p2: Person) -> Bool {
                return manager.friendCount(of: p1) < manager.friendCount(of: p2)
            }
        } catch {
            
        }
        

    }
}

FriendshipManager.test()
