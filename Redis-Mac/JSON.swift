//
//  JSON.swift
//  Redis-OSX
//
//  Created by chengpanwang on 2017/2/22.
//  Copyright © 2017年 chengpanwang. All rights reserved.
//

import Foundation

func prettyJSON(jsonObject:Any) -> String{
    return toJSON(jsonObject: jsonObject, writeOption: JSONSerialization.WritingOptions.prettyPrinted)
}


func miniJSON(jsonObject:Any) -> String{
    return toJSON(jsonObject: jsonObject, writeOption: [])
}


func toJSON(jsonObject:Any, writeOption:JSONSerialization.WritingOptions) -> String{
    do {
        
        let out = OutputStream(toMemory: ())
        out.open()
        
        if JSONSerialization.isValidJSONObject(jsonObject) {
            
           
            JSONSerialization.writeJSONObject(jsonObject, to: out, options: writeOption, error: nil)
           
            
            let data =  out.property(forKey: Stream.PropertyKey.dataWrittenToMemoryStreamKey) as! Data
            
            
            return String(data: data, encoding: String.Encoding.utf8)!
            
        }
        
        out.close()
        
    } catch let error as NSError {
        logger.info("format json error: \(error.domain)")
    }
    
    return ""
}

