//
//  RedisModel.swift
//  Redis-OSX
//
//  Created by chengpanwang on 2017/2/22.
//  Copyright © 2017年 chengpanwang. All rights reserved.
//

class RedisServer: Id{
    
    // name
    var name: String?
    
    // redis host
    var host: String = "127.0.0.1"
    
    // redis port
    var port: UInt = 6379
    
    // redis pasword
    var password: String?
    
    
    init(id: String, name: String, host: String, port: UInt, password: String) {
        super.init(id: id)
        self.name = name
        self.host = host
        self.port = port
        self.password = password
    }

    init(host:String, port: UInt) {
        super.init()
        self.name = host
        self.host = host
        self.port = port
    }

    
    init(name:String, host:String, port:UInt) {
        super.init()
        self.name = name
        self.host = host
        self.port = port
    }
    
    init(name:String, host:String, port:UInt, password:String) {
        super.init()
        self.name = name
        self.host = host
        self.port = port
        self.password = password
        
        
    }
    
    
}
