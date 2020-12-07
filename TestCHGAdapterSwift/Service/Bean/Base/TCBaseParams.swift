//
//  TCBaseParams.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/2.
//

import UIKit

protocol TCPublicProtocol : Codable {
    var appId: String? { get set }
    var token: String? { get set }
    var platform: String? { get set }
    var timestamp: String? { get set }
    var version: String? { get set }
}

struct TCBaseParams: TCPublicProtocol {
    var appId: String?
    
    var token: String?
    
    var platform: String?
    
    var timestamp: String?
    
    var version: String?
}
