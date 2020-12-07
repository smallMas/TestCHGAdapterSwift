//
//  TCDataWraper.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/2.
//

import UIKit
import HandyJSON

protocol TCDataType : HandyJSON {
    associatedtype T
    var data:T? { get set }
    var code : Int? { get }
    var message : String? { get }
}

class TCDataWraper<T:HandyJSON>: TCDataType {
    var data: T?
    var code : Int?
    var message : String?
    public required init() {
        
    }
    
    func isSuccess() -> Bool {
        return self.code == 200
    }
}
