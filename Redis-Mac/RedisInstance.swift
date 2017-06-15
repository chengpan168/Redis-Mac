//
//  RedisDB.swift
//  Redis-OSX
//
//  Created by chengpanwang on 2017/2/25.
//  Copyright © 2017年 chengpanwang. All rights reserved.
//

class RedisInstance {
    var isConnected:Bool = false
    
    var dbCount:UInt = 16
    
    var dbs = [RedisDB]()
    
    var redisClient:RedisClient?
    
    
    func connect(server: RedisServer) -> Bool {
        self.redisClient = RedisClient(host: server.host, port: server.port, password: server.password)
        self.isConnected = (self.redisClient?.isConnected)!
        return isConnected
        
        
    }
    
    
    func initRedis() {
        if isConnected {
            redisClient?.info()
        }
    }
}
