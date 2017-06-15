//
//  UserDefaultsSettable.swift
//  Redis-Mac
//
//  Created by chengpanwang on 2017/6/12.
//  Copyright © 2017年 chengpan. All rights reserved.
//

import Foundation

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where defaultKeys.RawValue==String {
    
    static func set(value: Any?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
    
    static func array(forKey key: defaultKeys) -> [Any]? {
        let aKey = key.rawValue
        return UserDefaults.standard.array(forKey: aKey)
    }
    
    
    static func arrayGet(forKey key: defaultKeys, id: String) -> Any {
        let aKey = key.rawValue
        let array = UserDefaults.standard.array(forKey: aKey)
        return array?.filter{(item) -> Bool in
            return (item as! Id).id == id
        }
    }
    

    static func arrayAdd(forKey key: defaultKeys, value: Id) {
        let aKey = key.rawValue
        var array = UserDefaults.standard.array(forKey: aKey)
        if (array == nil) {
            array = []
        }
        array?.append(value)
        
        UserDefaults.standard.setValue(array, forKey: aKey)
    }
}
