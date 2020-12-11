//
//  TCMainViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/7.
//

import UIKit

class TCMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initControllers()
    }
    
    func initControllers() -> Void {
        let vc1 = self.create(controller: self.createController(className: "TCMessageListController",workName: "TestCHGAdapterSwift"), normalImg: nil, selectImg: nil, title: "讯息")
        let vc2 = self.create(controller: self.createController(className: "TCFriendListController",workName: "TestCHGAdapterSwift"), normalImg: nil, selectImg: nil, title: "关系")
        
        self.viewControllers = [vc1,vc2]
        
        UITabBar.appearance().barTintColor = COLHEX(s: "#FAFAFA")
    }
    
    func create(controller:UIViewController, normalImg:String?, selectImg:String?, title:String?) -> UIViewController {
        let nav : TCBaseNavigationController = TCBaseNavigationController(rootViewController: controller)
        var normalImage : UIImage?
        var selectedImage : UIImage?
        if let normalImg = normalImg {
            normalImage = UIImage(named: normalImg)
        }
        if let selectImg = selectImg  {
            selectedImage = UIImage(named: selectImg)
        }
        nav.tabBarItem = self.createTabbarItem(title: title, image: normalImage, selectedImage: selectedImage)
        
        if normalImg != nil {
            nav.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        nav.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 16),NSAttributedString.Key.foregroundColor:COLHEX(s: "#969696")], for: UIControl.State.normal)
        return nav
    }
    
}
