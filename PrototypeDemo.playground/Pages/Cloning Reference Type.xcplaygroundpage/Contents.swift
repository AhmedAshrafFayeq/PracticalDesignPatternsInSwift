import Foundation

class NameClass {
    var firstName, lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

//extension declares the description property
extension NameClass: CustomStringConvertible {
    var description: String {
        return "NameClass(firstName: \"\(firstName)\", lastName: \"\(lastName)\")"
    }
}

var eslam = NameClass(firstName: "Eslam", lastName: "Ali")
var ahmed = eslam

print("\(eslam), \(ahmed)")

eslam.firstName = "esso"
eslam.lastName = "3lol"

print("\(eslam), \(ahmed)")

print("-----------------------------------")


/// implement Prototype Dp
extension NameClass: NSCopying {
    
    //this method returns a new instance and passses the property values of the object to the newely created one
    
    func copy(with zone: NSZone? = nil) -> Any {
        return NameClass(firstName: self.firstName, lastName: self.lastName)
    }
}

ahmed = eslam.copy() as! NameClass
// now the clone and the prototype point to different objects
// and changing one instance doesn't affect the other one

eslam.firstName = "Eslammm"
eslam.lastName = "Aliii"

print("\(eslam), \(ahmed)")

print("-----------------------------------")

extension NameClass {
    func clone() -> NameClass {
        return self.copy() as! NameClass
    }
}

var shifo = ahmed.clone()
print("\(ahmed), \(shifo)")

shifo.firstName = "ahmed"
shifo.lastName = "sherif"

print("\(ahmed), \(shifo)")
print("-----------------------------------")


// we can't overload the equality operator to make it work (happen only in value types)
// but we can implement copy behaviour 
