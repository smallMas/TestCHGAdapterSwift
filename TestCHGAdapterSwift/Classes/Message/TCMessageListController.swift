//
//  TCMessageListController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/8.
//

import UIKit
enum MessageMenu : Int {
    case rx
    case other
}

class TCMessageListController: TCTableViewController {

    lazy var btn:UIButton = UIButton.create(type: UIButton.ButtonType.custom, targe: self, action: #selector(tapClick))
    
    var menuArray : Array<Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "讯息";
        self.setupView()
    }
 
    func setupView() -> Void {
//        self.btn.backgroundColor = COLHEX(s: "#FF00FF")
//        self.view.addSubview(self.btn)
//        self.btn.snp.makeConstraints { (make) in
//            make.width.height.equalTo(100)
//            make.center.equalTo(self.view)
//        }
        
        self.view .addSubview(self.tableView)
        menuArray = [
            TCMenuModel(title: "RX功能", type: MessageMenu.rx.rawValue, cellName: nil, height: 44),
            TCMenuModel(title: "其他功能", cls: TCOtherViewController.self, cellName: nil, height: 44)
        ];
        self.tableView.cellDatas = self.menuArray
        self.tableView.reloadData()
        self.tableView.setTableViewDidSelectRowBlock { [weak self] (tableView, indexpath, data) in
            let model : TCMenuModel = data as! TCMenuModel
            if let clsType = model.cls as? UIViewController.Type {
                let vc = clsType.init();
                self?.navigationController?.pushViewController(vc, animated: true)
            }else {
                let menuType = model.type
                switch menuType {
                case MessageMenu.rx.rawValue:
                    self!.tapClick()
                    break
                default:
                    break
                }
            }
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
            TCMenuModel(title: "RX_ReplaySubject", cls: TCRXReplaySubjectViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_VariableSubject", cls: TCRXVariableSubjectViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "RX_TextField", cls: TCRXTextFieldViewController.self, cellName: nil, height: 44),
            TCMenuModel(title: "测试string table", cls: StringViewController.self, cellName: nil, height: 44)
        ];
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
