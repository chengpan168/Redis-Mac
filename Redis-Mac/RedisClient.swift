//
//  RedisClient.swift
//  Redis-OSX
//
//  Created by chengpanwang on 2017/2/25.
//  Copyright © 2017年 chengpanwang. All rights reserved.
//

import Foundation
import Redbird

class RedisClient {
    
    var client:Redbird? = nil
    var isConnected:Bool = false

    init( host:String, port:UInt, password:String? = nil) {
        logger.info("初始化redis客户端\(host), \(port), \(password)")
        do {
            
            let config = RedbirdConfig(address: host, port: UInt16(port))
            self.client = try Redbird(config: config)
            
            let res = try client?.command("ping")
            
            if try res?.toString() == "PONG" {
                isConnected = true
                logger.info("初始化redis客户端成功")
            } else {
                logger.info("初始化redis客户端失败")
            }
            
        } catch {
            print("初始化redis客户端错误: \(error)")
        }
    }
    
    func info() {
        do {
            let res = try client?.command("info")
            let info = try res?.toString()
            logger.info(info)
        } catch {
            print("初始化redis客户端错误: \(error)")
        }
    }
}
