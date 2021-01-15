//
//  TCMessageListController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/8.
//

import UIKit
class Human {
    var age: Int?
    var name: String?
    var nicknames: [String] = [String]()

    //返回指向 Human 实例头部的指针
    func headPointerOfClass() -> UnsafeMutablePointer<Int8> {
        let opaquePointer = Unmanaged.passUnretained(self as AnyObject).toOpaque()
        let mutableTypedPointer = opaquePointer.bindMemory(to: Int8.self, capacity: MemoryLayout<Human>.stride)
        return UnsafeMutablePointer<Int8>(mutableTypedPointer)
    }
}
class TCMessageListController: TCTableViewController {

    lazy var btn:UIButton = UIButton.create(type: UIButton.ButtonType.custom, targe: self, action: #selector(tapClick))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "讯息";
        
//        let model = TCFriendModel()
////        let modelPtr : UnsafeMutablePointer<Int8> = model.headPointerOfClass()
//
//        let arrFormJson = ["goudan","zhaosi", "wangwu"]
//
//        //拿到指向 human 堆内存的 void * 指针
//        let humanRawPtr = UnsafeMutableRawPointer(model.headPointerOfClass())
//
//        //nicknames 数组在内存中偏移 64byte 的位置(16 + 16 + 32)
//        let humanNickNamesPtr = humanRawPtr.advanced(by: 64).assumingMemoryBound(to: Array<String>.self)
//        print("model.friendsId1 : \(model.friendUserId)")
//             //[]
//        humanNickNamesPtr.initialize(to: arrFormJson)
//        print("model.friendsId2 : \(model.friendUserId)")
        
        
        
//        let human = Human()
//        let arrFormJson = ["goudan","zhaosi", "wangwu"]
//
//        //拿到指向 human 堆内存的 void * 指针
//        let humanRawPtr = UnsafeMutableRawPointer(human.headPointerOfClass())
//
//        //nicknames 数组在内存中偏移 64byte 的位置(16 + 16 + 32)
//        let humanNickNamesPtr =  humanRawPtr.advanced(by: 64).assumingMemoryBound(to: Array<String>.self)
//        print("human.nicknames1 : \(human.nicknames)")
//             //[]
//
//        humanNickNamesPtr.initialize(to: arrFormJson)
////        human.nicknames           //["goudan","zhaosi", "wangwu"]
//        print("human.nicknames2 : \(human.nicknames)")
////        print("age : \(human.age)")
////        print("name : \(human.name)")
        
        self.setupView()
    }
 
    func setupView() -> Void {
        self.btn.backgroundColor = COLHEX(s: "#FF00FF")
        self.view.addSubview(self.btn)
        self.btn.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }
    }
    
    @objc func tapClick() -> Void {
        let vc : TCMenuListController = TCMenuListController()
        vc.title = "RX 测试";
        vc.menuArray = [
            TCMenuModel(title: "RX_TableView", cls: TCRXTableViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_ObservableCreate", cls: TCRXObservableCreateController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_ObservableOf", cls: TCRXObservableOfController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_Subscribe", cls: TCRxSubscribeController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_生命周期", cls: TCRxOnViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_Dispose", cls: TCRXDisposeViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_绑定", cls: RCRXBindViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_扩展", cls: TCRXExViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_Subjects", cls: TCRXSubjectsViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_BehaviorSubject", cls: TCRXBehaviorSubjectViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_ReplaySubject", cls: TCRXReplaySubjectViewController.self, cellName: nil, height: 44)
        ];
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
