//
//  RedisModel.swift
//  Redis-OSX
//
//  Created by chengpanwang on 2017/2/22.
//  Copyright © 2017年 chengpanwang. All rights reserved.
//

class RedisServerModel{
    
    
    // ip
    var ip: String = "127.0.0.1"
    
    //别名
    var name: String?
    
    // 端口
    var port: UInt16 = 6379
    // 密码
    var password: String?
    
    var isConnected:Bool = false
    
    var dbCount:UInt = 16
    
    var dbs = [RedisDB]()
    
    var redisClient:RedisClient?
    

    init(ip:String, port:UInt16) {
        self.name = ip
        self.ip = ip
        self.port = port
        dbs = [RedisDB(), RedisDB()]
    }

    
    init(name:String, ip:String, port:UInt16) {
        self.name = name
        self.ip = ip
        self.port = port
    }
    
    init(name:String, ip:String, port:UInt16, password:String) {
        logger.info("初始化redis server")
        
        self.name = name
        self.ip = ip
        self.port = port
        self.password = password
        
        
    }
    
    func connect() -> Bool {
        self.redisClient = RedisClient(host: ip, port: port, password: password)
        self.isConnected = (self.redisClient?.isConnected)!
        return isConnected
        
        
    }
    
    
    func initRedis() {
        if isConnected {
            redisClient?.info()
        }
    }
    
}
