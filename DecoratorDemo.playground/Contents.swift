// UserDefaults doesn't have to store and retrieve date instances
// So I'll add set date for key, and date for methods

import Foundation

class UserDefaultsDecorator: UserDefaults {
    
    private var userDefaults = UserDefaults.standard
    
    convenience init(userDefaults: UserDefaults) {
        self.init()
        self.userDefaults = userDefaults
    }
    
    func set(date: Date, forKey key: String) {
        userDefaults.set(date, forKey: key)
    }
    
    func date(forKey Key: String) -> Date? {
        return userDefaults.value(forKey: Key) as? Date
    }
}

let userDefaults = UserDefaultsDecorator()
userDefaults.set(42, forKey: "the answer")
print(userDefaults.value(forKey: "the answer") ?? "-")

userDefaults.set(date: Date(), forKey: "now")
print(userDefaults.date(forKey: "now") ?? "-")

// Extension can add functions and computed prop
//but we can't override existing methods, can't add stored property and property observers
