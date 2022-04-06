protocol Serializable {
    func serialize()
}

class JSONSerilaizer: Serializable {
    func serialize() {
        print("JSONSerilaizer \(#function)")
    }
}


class PropertyListSerializer: Serializable {
    func serialize() {
        print("PropertyListSerializer \(#function)")
    }
}


class XMLSerializer: Serializable {
    func serialize() {
        print("XMLSerializer \(#function)")
    }
}

enum Serializers {
    case json
    case plist
    case xml
}

func makeSerializer(_ type: Serializers) -> Serializable? {
    let result: Serializable?
    switch type {
    case .json: result = JSONSerilaizer()
    case .plist: result = PropertyListSerializer()
    case .xml: result = XMLSerializer()
    }
    return result
}


let jsonSerializer = makeSerializer(.json)
jsonSerializer?.serialize()

let xmlSerializer = makeSerializer(.xml)
xmlSerializer?.serialize()


let plistSerializer = makeSerializer(.plist)
plistSerializer?.serialize()

//----------------------------------------------------
print("-------------------------------------------")

struct SerializerFactory {
    
    static func makeSerializer(_ type: Serializers) -> Serializable? {
        let result: Serializable?
        switch type {
        case .json: result = JSONSerilaizer()
        case .plist: result = PropertyListSerializer()
        case .xml: result = XMLSerializer()
        }
        return result
    }
}

let plistSerializer2 = SerializerFactory.makeSerializer(.plist)
plistSerializer2?.serialize()
