//
//  TCTTModel.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/7.
//

import UIKit
import HandyJSON

enum TTState:Int,HandyJSONEnum {
    
    case none = 0
    case ing = 1
    case ed = 2
}

class TCTTModel: HandyJSON {
    var name : String?
    var state : TTState?
    
    required init() {}
}
class BasicTypes: HandyJSON {
    var int: Int = 2
    var doubleOptional: Double?
    var stringImplicitlyUnwrapped: String!

    required init() {}
}
