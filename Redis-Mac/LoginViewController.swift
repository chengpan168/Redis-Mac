//
//  LoginViewController.swift
//  Redis-Mac
//
//  Created by chengpanwang on 2017/6/9.
//  Copyright © 2017年 chengpan. All rights reserved.
//

import AppKit

class LoginViewController: NSViewController {
    
    @IBOutlet weak var idField: NSTextField!
    @IBOutlet weak var hostField: NSTextField!
    @IBOutlet weak var portField: NSTextField!
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var passwordField: NSSecureTextField!
    
    
    override func viewDidLoad() {
        logger.debug("login view loaded")
        getServers()
    }
    
    func getServers() {
        UserDefaults.RedisServerInfo.set(value: "hello", forKey: .servers)
        let servers = UserDefaults.RedisServerInfo.string(forKey: .servers)
        print("servers:", servers)
    }
    func addRedisServer(redisServer: RedisServer) {
        UserDefaults.RedisServerInfo.set(value: redisServer, forKey: .servers)
    }
    
    func delServer() {
        
    }
    
    func getFieldServer() -> RedisServer{
        let id = idField.stringValue
        let host = hostField.stringValue
        let name = nameField.stringValue
        let port = portField.intValue
        let password = passwordField.stringValue
        
        let server = RedisServer(id: id, name: name, host: host, port: UInt(port), password: password)
        return server
    }
    
    
    @IBAction func addServer(_ sender: NSButton) {
        
        var server = getFieldServer()
        server.id = UUID().uuidString
        
        logger.info("add server\(server)")
        
        UserDefaults.RedisServerInfo.arrayAdd(forKey: .servers, value: server)
        
        logger.info(UserDefaults.RedisServerInfo.array(forKey: .servers))
    }
   
    @IBAction func connectServer(_ sender: NSButton) {
        logger.info("connect server")
    }
    
    @IBAction func saveServer(_ sender: NSButton) {
        logger.info("save server")
        logger.info(hostField.stringValue)
        logger.info(portField.stringValue)
        logger.info(passwordField.stringValue)
    }
}

extension LoginViewController: NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 10
    }
}

extension LoginViewController: NSTableViewDataSource {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    
        // 3
        if let cell = tableView.make(withIdentifier: "favorites", owner: nil) as? NSTableCellView {
            
            cell.textField?.stringValue = "hello"
            return cell
        }
        return nil
    }}
