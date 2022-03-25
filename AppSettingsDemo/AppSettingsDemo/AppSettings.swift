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
    
    private var settings: [String: Any] = [
                                            "Theme": "Dark",
                                            "MaxConcurrentDownload": 4
    ]
    
    // private ensure to only use intializer within the class declaration and its extensions in the same file
    private init() {}
    
    public func string(forKey key: String) -> String?{
        settings[key] as? String
    }
    
    public func int(forKey key: String) -> Int?{
        settings[key] as? Int
    }
}
