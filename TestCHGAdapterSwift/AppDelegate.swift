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
//        self.test2()
        self.test3()
        
        self.initNotification()
        
        self.changeRoot()
        
        return true
    }
    
    func test() -> Void {
        let json = "{\"name\":\"fansj\",\"state\":\"1\",\"hobbies\":[\"足球\",\"篮球\"],\"userEduItem\":[{\"schoolName\":\"南通大学\",\"schoolId\":\"10001\"},{\"schoolName\":\"江苏大学\",\"schoolId\":\"10002\"}],\"work\":{\"positionName\":\"iOS高级工程师\",\"companyName\":\"源点\"}}"
        let model = TCTTModel.deserialize(from: json)
            print("解析成功")
//        if let model = model {
//            print("name : \(model.name)")
//            print("state : \(model.state)")
//            print("hobbies : \(model.hobbies)")
//            print("userEduItem ======")
//            if let userEduItem = model.userEduItem {
//                for schoolModel in userEduItem {
//                    print("schoolModel name : \(schoolModel.schoolName)")
//                    print("schoolModel id : \(schoolModel.schoolId)")
//                }
//            }
//            print("work ===== ")
//            if let work = model.work {
//                print("wordModel positionName : \(work.positionName)")
//                print("wordModel companyName : \(work.companyName)")
//            }
//        }
    }
    
    func test2() -> Void {
        let json = "{\"name\":\"fansj\",\"state\":1,\"hobbies\":[\"足球\",\"篮球\"],\"userEduItem\":[{\"schoolName\":\"南通大学\",\"schoolId\":\"10001\"},{\"schoolName\":\"江苏大学\",\"schoolId\":\"10002\"}],\"work\":{\"positionName\":\"iOS高级工程师\",\"companyName\":\"源点\"}}"
        let data = json.data(using: String.Encoding.utf8)
        if let data = data {
            let model = try?JSONDecoder().decode(TCTTModel.self, from: data)
            print("name : \(model?.name)")
//            print("state : \(model?.state)")
//            print("hobbies : \(model?.hobbies)")
//            print("userEduItem ======")
//            if let userEduItem = model?.userEduItem {
//                for schoolModel in userEduItem {
//                    print("schoolModel name : \(schoolModel.schoolName)")
//                    print("schoolModel id : \(schoolModel.schoolId)")
//                }
//            }
//            print("work ===== ")
//            if let work = model?.work {
//                print("wordModel positionName : \(work.positionName)")
//                print("wordModel companyName : \(work.companyName)")
//            }
        }
    }
    
    func test3() -> Void {
        let json = "[{\"name\":\"fansj\"},{\"name\":\"fanhr\"},{\"name\":\"wangzy\"}]"
//        var array = JSONDeserializer<Array<TCTTModel>>.deserializeFrom(json: json)
//        print("array : \(array)")
        
        //转data
        if let jsonData = json.data(using: .utf8){
            //一：原生解析方法
            //获取需要的内容，需要考虑数据是否存在，是否拆包
//            let dicArr = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [[String:AnyObject]]
//            print("打印所有数据:\(dicArr)")
//            let name = dicArr[0]["name"] as! String
//            print("原生获取name \(name)")
            
            let array = try?JSONDecoder().decode(Array<TCTTModel>.self, from: jsonData)
            print("array >>> \(array)")
        }
    }
    
    func initNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(loginRegisterSuccess), name: NSNotification.Name(rawValue: kNoticeRegisterLogin), object: nil)
    }
    
    func changeRoot() -> Void {
        if TCUserManager.sharedInstance.isLogin() {
//            let vc : TCMenuListController = TCMenuListController()
//            let nav : TCBaseNavigationController = TCBaseNavigationController(rootViewController: vc)
//            self.window?.rootViewController = nav
            
            self.window?.rootViewController = TCMainViewController()
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
                    model.collegeStudentAuth = infoModel.collegeStudentAuth;
                    model.userEduItem = infoModel.userEduItem;
                    model.userWorkItem = infoModel.userWorkItem;
                    model.sex = infoModel.sex;
                    model.name = infoModel.name;
                    model.userLabels = infoModel.userLabels;
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

