//
//  AppDelegate.swift
//  Redis-Mac
//
//  Created by chengpanwang on 2017/6/9.
//  Copyright © 2017年 chengpan. All rights reserved.
//

import Cocoa
import XCGLogger


let logger: XCGLogger = {
    let log = XCGLogger.default
    log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: "logs/redis-mac.log", fileLevel: .debug)
    return log
}()

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

extension UserDefaults {
    // redis server list
    struct RedisServerInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case servers
        }
    }
  
}

