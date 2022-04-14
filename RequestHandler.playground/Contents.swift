import Foundation

protocol RequestHandling {
    
    init(next: RequestHandling?)
    func handle(request: Any)
}

final class Handler <T>: RequestHandling, CustomStringConvertible {
    private var nextHandler: RequestHandling?
    
    init(next: RequestHandling?) {
        self.nextHandler = next
    }
    
    func handle(request: Any) {
        if request is T {
            print("Request Processed by \(self)")
        }else {
            guard let handler = nextHandler else {
                print("Reached to the end of the responder chain")
                return
            }
            handler.handle(request: request)
            print("\(self) can't handle \(T.self) requests - forwarding to \(handler)")
        }
    }
    
    var description: String {
        return "\(T.self) Handler"
    }
}

let dataHandler = Handler<Data>(next: nil)
let stringHandler = Handler<String>(next: dataHandler)
let dateHandler = Handler<Date>(next: stringHandler)

let data = Data(repeating: 0, count: 10)
dataHandler.handle(request: data)

//should to end of the 
dataHandler.handle(request: 42)
