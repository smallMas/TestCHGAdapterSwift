//
//  TCLoginBean.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/4.
//

import UIKit

struct TCLoginBean: TCPublicProtocol {
    var appId: String?
    var token: String?
    var platform: String?
    var timestamp: String?
    var version: String?
    
    
    // 手机号
    var mobile : String?
    // 注册校验码
    var code : String?
    // 国家代码
    var countryCode : String?
    // 手机区号
    var phoneCode : String?
}
