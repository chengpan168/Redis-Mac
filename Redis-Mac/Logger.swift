//
//  Logger.swift
//  Redis-OSX
//
//  Created by chengpanwang on 2017/2/20.
//  Copyright © 2017年 chengpanwang. All rights reserved.
//

import Cocoa
import Foundation
import XCGLogger

var APP_LOG_PATH = ""
var APP_LOG_DIRECTORY = ""

let logger: XCGLogger = {
    // Setup XCGLogger
    let log = XCGLogger.default
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMddhhmm"
    let dateStr = dateFormatter.string(from: Date())
    
    let bundleId = Bundle.main.bundleIdentifier!
    let fileName = "\(bundleId).\(dateStr).txt"
    
    APP_LOG_DIRECTORY = "\(NSHomeDirectory())/Library/Logs/\(bundleId)/"
    APP_LOG_PATH = "\(APP_LOG_DIRECTORY)/\(fileName)"
    
    let isExistDirectory:Bool = FileManager.default.fileExists(atPath: APP_LOG_DIRECTORY, isDirectory: nil)
    if !isExistDirectory {
        do{
            try FileManager.default.createDirectory(atPath: APP_LOG_DIRECTORY, withIntermediateDirectories: true, attributes: nil)
        }
        catch {
            print("createDirectoryAtPath fail,can't log")
        }
    }
    
    log.setup(level: .debug, showThreadName: false, showLevel: true, showFileNames: false, showLineNumbers: false, writeToFile: APP_LOG_PATH as AnyObject?)
    
    return log
}()
