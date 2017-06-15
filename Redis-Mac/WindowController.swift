//
//  WindowController.swift
//  Redis-Mac
//
//  Created by chengpanwang on 2017/6/9.
//  Copyright © 2017年 chengpan. All rights reserved.
//

import AppKit

class WindowController: NSWindowController {
    var title = "Redis Mac"
    
    override func windowDidLoad() {
        logger.info("window loaded")
    }
    
    override func windowTitle(forDocumentDisplayName displayName: String) -> String {
        return title
    }
}
