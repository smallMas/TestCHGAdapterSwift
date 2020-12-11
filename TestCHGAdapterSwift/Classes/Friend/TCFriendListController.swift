//
//  TCFriendListController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/8.
//

import UIKit

class TCFriendListController: TCTableViewController {

    private var dataArray : Array<Any>?
    var label:UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "关系";
        
        self.view.addSubview(self.tableView)
        self.requestFriendList()
        
//        var model = TCFriendModel()
//        (model as! NSObject).setValue("alfjlj", forKey: "tags")
    }
    
    // MARK: - 网络请求
    private func requestFriendList() -> Void {
        var bean = TCFriendListBean()
        bean.pageIndex = 1
        bean.pageSize = 20
        TCService.request(name: TC_FriendList, params: bean, dataType: [TCFriendModel].self) { [weak self](res, error, isSuccess) in
            if isSuccess {
//                if let array = res?.data {
//                    for model in array {
//                        print("tags : \(model.tags)")
//                    }
//                }
                self?.dataArray = res?.data
                self?.reloadData()
            }
        }
    }

    // MARK: - 逻辑处理
    private func reloadData() -> Void {
        self.tableView.cellDatas = self.dataArray
        self.tableView.reloadData()
    }
}
