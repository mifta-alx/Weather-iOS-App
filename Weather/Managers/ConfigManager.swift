//
//  ConfigManager.swift
//  Weather
//
//  Created by Alx on 10/09/24.
//

import Foundation

class ConfigManager {
    static let shared = ConfigManager()
    
    private init() {}
    
    func apiKey() -> String {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: path),
              let apiKey = plist["API_KEY"] as? String else {
            fatalError("Couldn't find API_KEY in Config.plist")
        }
        return apiKey
    }
}
