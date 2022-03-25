//
//  AppSettings.swift
//  AppSettingsDemo
//
//  Created by Ahmed Fayeq on 25/03/2022.
//

import Foundation

//final-> to prevent the creation of subclasses
final public class AppSettings {
    
    // Swift gurantees that static is thread safe -to ensure that there are no multiple AppSettings instances if multiple threads access the static property at once.
    public static let shared = AppSettings()
    
    //There are a problem when read and write at the same time (Singleton is not a thread safe)
    //so we have to make it thread safe by creating (SerialQueue)
    private let serialQueue = DispatchQueue(label: "serialQueue")
    
    private var settings: [String: Any] = [
                                            "Theme": "Dark",
                                            "MaxConcurrentDownload": 4
    ]
    
    // private ensure to only use intializer within the class declaration and its extensions in the same file
    private init() {}
    
    public func string(forKey key: String) -> String? {
        serialQueue.sync {
            return settings[key] as? String
        }
    }
    
    public func int(forKey key: String) -> Int? {
        serialQueue.sync {
            return settings[key] as? Int
        }
    }
    
    public func value(forKey key: String) -> Any? {
        serialQueue.sync {
            return settings[key]
        }
    }
    
    public func set(value: String, forKey key: String) {
        //we have to serialize the access to set value forKey
        //if multiple threads are calling the method conccurently the task will be serialized and excuted one after the other.
        serialQueue.sync {
            settings[key] = value
        }
    }
}
