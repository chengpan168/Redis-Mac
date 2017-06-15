//
//  DBUtil.swift
//  Redis-OSX
//
//  Created by chengpanwang on 2017/2/24.
//  Copyright © 2017年 chengpanwang. All rights reserved.
//

import Foundation

class DBUtil {
    
    static func set(forKey name:String, value obj:Any) {
        UserDefaults.standard.set(obj, forKey: name)
    }
    
    
    static func getDictionary(forKey name:String) -> Any{
        return UserDefaults.standard.dictionary(forKey: name)
    }
    
}
