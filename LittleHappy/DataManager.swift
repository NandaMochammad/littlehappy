//
//  DataManager.swift
//  LittleHappy
//
//  Created by William Sjahrial on 20/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    static let shared = DataManager()
    
    var initialized: Bool = false
    var name: String = ""
    var age: Int = 0
    var gender: Gender = .unspecified
    
    private override init(){}
    
    func saveDataToUserDefaults() {
        
        let defaults = UserDefaults.standard
        defaults.set(initialized, forKey:"initialized")
        defaults.set(name, forKey: "name")
        defaults.set(age, forKey: "age")
        defaults.set(gender.rawValue, forKey: "gender")
        defaults.synchronize()
        
    }
    
    func loadDataFromUserDefaults() {
        
        let defaults = UserDefaults.standard
        initialized = defaults.bool(forKey: "initialized")
        name = defaults.string(forKey: "name") ?? ""
        age = defaults.integer(forKey: "age")
        let genderRawValue = defaults.string(forKey: "gender") ?? "UNSPECIFIED"
        gender = Gender(rawValue: genderRawValue) ?? .unspecified
        
    }
    
    func printData() {
        print("initialized: \(initialized)")
        print("name: \(name)")
        print("age: \(age)")
        print("gender: \(gender)")
    }
    
    
    
}
