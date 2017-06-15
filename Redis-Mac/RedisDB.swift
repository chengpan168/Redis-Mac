//
//  RedisDB.swift
//  Redis-Mac
//
//  Created by chengpanwang on 2017/6/14.
//  Copyright © 2017年 chengpan. All rights reserved.
//

import Foundation

class RedisDB {
    var name:String
    var index:UInt
    var dbSize:UInt
    
    
    init() {
        self.name = "name"
        self.index = 0
        self.dbSize = 16
    }
    
    init(name:String, index:UInt, dbSize:UInt) {
        self.name = name
        self.index = index
        self.dbSize = dbSize
    }
}
