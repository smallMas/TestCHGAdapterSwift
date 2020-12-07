//
//  TCUtility.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/1.
//

import UIKit

class TCUtility: NSObject {
    static func getCurrentTimeStamp() -> String {
        let date = NSDate()
        let time : TimeInterval = date.timeIntervalSince1970
        return String(format: "%.0f", time*1000)
    }
    
    static func uuid() -> String {
        let uuid = UUID().uuidString
        return uuid
    }
}

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
     for (k, v) in dict {
      updateValue(v, forKey: k)
     }
    }
} 
