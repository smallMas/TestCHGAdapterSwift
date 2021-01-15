//
//  TCMenuListController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/1.
//

import UIKit
import CHGAdapter_swift
import HandyJSON

class TCMenuListController: TCTableViewController {

    var menuArray : Array<Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (self.menuArray != nil) && self.menuArray!.count > 0 {
            
        }else {
            self.menuArray = [TCMenuModel(title: "cell1", cls: nil, cellName: nil, height: 44),
                              TCMenuModel(title: "cell2", cls: nil, cellName: nil, height: 44),
                              TCMenuModel(title: "cell3", cls: nil, cellName: nil, height: 44),
                              TCMenuModel(title: "cell4", cls: nil, cellName: nil, height: 44),
                              TCMenuModel(title: "cell5", cls: nil, cellName: nil, height: 44)];
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.cellDatas = self.menuArray
        self.tableView.reloadData()
        self.tableView.setTableViewDidSelectRowBlock { [weak self] (tableView, indexpath, data) in
            let model : TCMenuModel = data as! TCMenuModel
            if let clsType = model.cls as? UIViewController.Type {
                let vc = clsType.init();
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
//        TCService.request(name: TC_IpCountryCode, params: nil, clsString: nil)
//        TCService.request(name: TC_PrivacyNotice, params: nil, dataType TCPrivacyModel.Type)
        
//        TCService.request(name: TC_PrivacyNotice, params: TCNullParams.init(), dataType: TCPrivacyModel.self) { (res, error) in
//            print("res content : \(res?.data?.content)")
//        }
        
        let l = UIControl.State.normal
        print("l : \(l)")
        
        print("kSafeAreaEdgeInsets : \(kSafeAreaEdgeInsets)")
        
    }
}


