//
//  TCUserModel.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit
import HandyJSON

enum TCUnregisterStatus:Int,Codable,HandyJSONEnum {
    // 没有注销过
    case none = 0
    // 已申请了注销
    case applyed = 1
}

enum TCRealNameAuthStatus:Int,Codable,HandyJSONEnum {
    // 默认
    case defaultNone = 0
    // 未实名
    case not = 1
    // 已实名
    case already = 2
    // 禁用
    case disable = 3
    // 审核中
    case ing = 4
    // 失败
    case fail = 5
}

enum TCSplitEduTag:Int,Codable,HandyJSONEnum {
    // 不跳过
    case notSkip = 0
    // 跳过
    case skip = 1
}

class TCUserModel: TCBaseModel,Codable {
    var dId : String?
    var yxToken : String?
    var agoraToken : String?
    var agoraSinglingToken : String?
    var rtmAgoraSinglingToken : String?
    var otherId : String?
    var token : String?
    var userId : String?
    var logOffStatus : TCUnregisterStatus?
    var status : TCRealNameAuthStatus?
    var splitEduFinishTag : TCSplitEduTag?
    var eduItemCount : Int? // 教育经历个数
    var nickName : String?
    var avatar : String?
    var countryCode : String?
    var city : String?
    var nativePlace : String?
    var sex : Int?
    var name : String?
    var statusTag : String?
    var remarks : String?
    var finalShowName : String?
    var finalTagInfo : String?
    
//    userLabels
//    hobbies
//    userEduItem
//    userWorkItem
    required init() {
        
    }
}
