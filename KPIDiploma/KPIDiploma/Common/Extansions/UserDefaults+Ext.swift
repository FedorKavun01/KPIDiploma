//
//  UserDefaults+Ext.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 30.11.2022.
//

import Foundation

extension UserDefaults {
    public struct Key<T> {
        let key: String
        let defaultValue: T
        
        init(_ key: String, defaultValue: T) {
            self.key = key
            self.defaultValue = defaultValue
        }
    }
    
    static func get<T>(_ key: Key<T>) -> T {
        var value = standard.object(forKey: key.key)
        
        if value == nil {
            standard.setValue(key.defaultValue, forKey: key.key)
            value = get(key)
        }
        
        guard let result = value as? T else {
            fatalError("Unable to get setting '\(key.key)' of type '\(String(describing: T.self))' since the settings is type of '\(value.customMirror.subjectType)'")
        }
        
        return result
    }
    
    static func set<T>(_ key: Key<T>, to value: T?) {
        standard.setValue(value ?? key.defaultValue, forKey: key.key)
    }
}
