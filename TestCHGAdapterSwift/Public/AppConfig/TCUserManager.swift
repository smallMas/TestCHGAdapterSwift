//
//  TCUserManager.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

let PC_Loginer_Model = "PC_Loginer_Model"

class TCUserManager: NSObject {
    static let sharedInstance = TCUserManager()
    
    func saveUserModel(userModel:TCUserModel) -> Void {
        UserDefaults.standard.setItem(userModel, forKey: PC_Loginer_Model)
    }
    
    func getUserModel() -> TCUserModel? {
        let userModel = UserDefaults.standard.getItem(TCUserModel.self, forKey: PC_Loginer_Model)
        return userModel
    }
    
    func isLogin() -> Bool {
        let userModel = self.getUserModel()
        if userModel != nil && userModel?.userId != nil {
            return true
        }
        return false
    }
}

extension UserDefaults {
    func setItem<T: Encodable>(_ object: T, forKey key: String) {
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(object) else {
            return
        }
        self.set(encoded, forKey: key)
    }
        
    func getItem<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = self.data(forKey: key) else {
            return nil
        }
        let decoder = JSONDecoder()
        guard let object = try? decoder.decode(type, from: data) else {
            print("Couldnt find key")
            return nil
        }
        return object
    }
}
