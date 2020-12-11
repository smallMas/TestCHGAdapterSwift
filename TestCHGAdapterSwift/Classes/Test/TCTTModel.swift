//
//  TCTTModel.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/7.
//

import UIKit
import HandyJSON

class TCTTBaseModel: HandyJSON,Codable {
    var name : String?
    
    required init() {}
}

class TCTTModel: TCTTBaseModel {
    enum TTState:Int,HandyJSONEnum,Codable {
        case none = 0
        case ing = 1
        case ed = 2
    }
    
//    var name : String?
    var state : TTState?
    var hobbies : Array<String>?
    var userEduItem : Array<TCTTSchoolModel>?
    var work : TCTTWorkModel?
}

class TCTTSchoolModel: HandyJSON,Codable {
    var schoolName : String?
    var schoolId : String?
    
    required init() {}
}

class TCTTWorkModel: HandyJSON,Codable {
    var positionName : String?
    var companyName : String?
    
    required init() {}
}
