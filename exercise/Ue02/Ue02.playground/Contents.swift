import Cocoa

class Person: Hashable {
    
    var name: String
    
    init(name: String) {
        print("init Person\(name)")
        self.name = name
    }
    
    deinit {
        print("deinit Person \(name)")
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}

class FriendshipManager {
    
    init() {
        print("init FriendshipManager")
    }
    
    deinit {
        print("deinit FriendshipManager")
    }
    
    private var friendships: [Person: Set<Person>] = [:]
    
    func addFriendship(of person1: Person, with person2: Person) {
        if(friendships[person1] == nil) {
            friendships[person1] = []
        }
        
        if(friendships[person2] == nil) {
            friendships[person2] = []
        }
        
        friendships[person1]!.insert(person2)
        friendships[person2]!.insert(person1)
    }
    
    func friendCount(of: Person) -> Int {
        return friendships[of]?.count ?? 0
    }
    
    func removeFriend(of person1: Person, with person2: Person) throws {
        friendships[person1]?.remove(person2)
        friendships[person2]?.remove(person1)
    }
    
    func outputFriendsOfPerson(person: Person, sort: (Person, Person) -> Bool) {
        if let friends = friendships[person] {
            var description = "[ "
            for friend in friends.sorted(by: sort) {
                description += friend.name + "(" + String(friendCount(of: friend)) + ") "
            }
            description += "]"
            print(description)
        }
    }
    
    class func test() {
        let andreas = Person(name: "Andreas")
        let patrick = Person(name: "Patrick")
        let florian = Person(name: "Florian")
        let kuerlis = Person(name: "Kürlis")
        
        let manager = FriendshipManager()
        manager.addFriendship(of: andreas, with: patrick)
        manager.addFriendship(of: florian, with: kuerlis)
        manager.addFriendship(of: patrick, with: florian)
        manager.addFriendship(of: kuerlis, with: patrick)
        
        print(andreas.name)
        manager.outputFriendsOfPerson(person: andreas, sort: namesAsc)
        print(florian.name)
        manager.outputFriendsOfPerson(person: florian, sort: namesAsc)
        print(patrick.name)
        manager.outputFriendsOfPerson(person: patrick, sort: friendCountAsc)
        
        func namesAsc(p1: Person, p2: Person) -> Bool {
            return p1.name < p2.name
        }
        
        func friendCountAsc(p1: Person, p2: Person) -> Bool {
            return manager.friendCount(of: p1) < manager.friendCount(of: p2)
        }
    }
}

FriendshipManager.test()
