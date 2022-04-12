import Foundation

class RandomIntWithID {
    var value: Int = {
        print("Value Intialized")
        return Int.random(in: Int.min...Int.max)
    }()
    
    lazy var uid: String = {
        print("UID intialized")
        return UUID().uuidString
    }()
}

let n = RandomIntWithID()
print(n.uid)
// uid intialized after using it for the first time
//lazy property not a thread safe
