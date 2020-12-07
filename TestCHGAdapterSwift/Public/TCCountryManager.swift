//
//  TCCountryManager.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

class TCCountryManager: NSObject {
    static let sharedInstance = TCCountryManager()
    
    func flag(country:String?) -> String? {
        if let country = country {
            let base = 127397
            var usv = String.UnicodeScalarView()
            for i in country.utf16 {
                usv.append(UnicodeScalar(base + Int(i))!)
            }
            return String(usv)
        }else {
            return ""
        }
    }
}
