//
//  AppDelegate.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/1.
//

import UIKit
import CoreData
import HandyJSON

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        self.test()
        
        self.initNotification()
        
        self.changeRoot()
        
        return true
    }
    
    func test() -> Void {
        let json = "{\"name\":\"fansj\",\"state\":\"1\"}"
//        let json = "{\"name\":\"fansj\"}"
        let model = TCTTModel.deserialize(from: json)
            print("解析成功")
        if let model = model {
            print("name : \(model.name)")
            print("state : \(model.state)")
        }
        
//        let jsonString = "{\"doubleOptional\":1.1,\"stringImplicitlyUnwrapped\":\"hello\",\"int\":1}"
//        if let object = BasicTypes.deserialize(from: jsonString) {
//            // …
//            print("name : \(object.doubleOptional)")
//            print("state : \(object.stringImplicitlyUnwrapped)")
//        }
            
        
//        if let model = JSONDeserializer<TCTTModel>.deserializeFrom(json: json) {
//            print("name : \(model.name)")
//            print("state : \(model.state)")
//        }
    }
    
    func initNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(loginRegisterSuccess), name: NSNotification.Name(rawValue: kNoticeRegisterLogin), object: nil)
    }
    
    func changeRoot() -> Void {
        if TCUserManager.sharedInstance.isLogin() {
            let vc : TCMenuListController = TCMenuListController()
            let nav : TCBaseNavigationController = TCBaseNavigationController(rootViewController: vc)
            self.window?.rootViewController = nav
        }else {
            let vc : TCLoginViewController = TCLoginViewController()
            let nav : TCBaseNavigationController = TCBaseNavigationController(rootViewController: vc)
            self.window?.rootViewController = nav
        }
    }
    
    @objc func loginRegisterSuccess(notification:Notification) -> Void {
        let model : TCUserModel = notification.object as! TCUserModel
        
        TCUserManager.sharedInstance.saveUserModel(userModel: model)
        
        var bean : TCMineInfoBean = TCMineInfoBean()
        bean.userId = model.userId
        TCService.request(name: TC_MineHomePage, params: bean, dataType: TCUserModel.self) { (res, error, isSuccess) in
            if (isSuccess) {
                let infoModel = res?.data
                if let infoModel = infoModel {
                    model.avatar = infoModel.avatar;
                    model.nickName = infoModel.nickName;
                    model.countryCode = infoModel.countryCode;
                    model.nativePlace = infoModel.nativePlace;
                    model.status = infoModel.status;
//                    model.collegeStudentAuth = infoModel.collegeStudentAuth;
//                    model.userEduItem = infoModel.userEduItem;
//                    model.userWorkItem = infoModel.userWorkItem;
                    model.sex = infoModel.sex;
                    model.name = infoModel.name;
//                    model.userLabels = infoModel.userLabels;
                    model.statusTag = infoModel.statusTag;
//                    model.hobbies = infoModel.hobbies;
                    model.remarks = infoModel.remarks;
                    model.finalShowName = infoModel.finalShowName;
                    model.finalTagInfo = infoModel.finalTagInfo;
//                    model.orgAuthStatus = infoModel.orgAuthStatus;
                    model.dId = infoModel.dId;
//                    model.schoolName = infoModel.userEduItem.schoolName;
//                    model.importContactsStatus = infoModel.importContactsStatus;
                    model.city = infoModel.city;
//                    model.coinPwdStatus = infoModel.coinPwdStatus;
                }
            }
            
            // 保存用户信息
            TCUserManager.sharedInstance.saveUserModel(userModel: model)
            
            self.changeRoot()
        }
    }
}

