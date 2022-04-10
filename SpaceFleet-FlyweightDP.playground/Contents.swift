import UIKit

//mesh & texture are immutable(unchangeable) so can be shared in flyweight.
//position is mutable(changeable) so can not be shared in flyweight.

class SpaceShip {
//    private let mesh: [Float]
//    private let texture: UIImage?
    
    private var intrinsicState: SharedSpaceShipData
    private var position: (Float, Float, Float)
    
    init(sharedData: SharedSpaceShipData, position: (Float, Float, Float) = (0,0,0)) {
        self.intrinsicState = sharedData
        self.position = position
    }
}

let fleetSize = 1000
var ships = [SpaceShip]()
var vertices = [Float](repeating: 0, count: 100)    // just a dummy array of floats

let sharedData = SharedSpaceShipData(mesh: vertices, imageNamed: "SpaceShip")

for _ in 0..<fleetSize {
    let ship = SpaceShip(sharedData: sharedData,
                         position: (Float.random(in: 1...100),
                                    Float.random(in: 1...100),
                                    Float.random(in: 1...100)))
    ships.append(ship)
}
//we have 1000 instances of ships //and they have the same (mesh,texture)
//so we can reduce memory usage by sharing common data betwwen objects
//but we should extract them in a class coz we need a reference type

///
///



class SharedSpaceShipData {
    private let mesh: [Float]
    private let texture: UIImage?
    
    init(mesh: [Float], imageNamed name: String) {
        self.mesh = mesh
        self.texture = UIImage(named: name)
    }
}
