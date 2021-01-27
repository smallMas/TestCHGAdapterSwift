//
//  TCBaseViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/1.
//

import UIKit
import HandyJSON

class TCBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
    }
    
    // 显示接口错误信息
    func showInterfaceError<H:HandyJSON>(res:TCDataWraper<H>?) -> Void {
        guard let res = res, res.isSuccess(),let msg = res.message, msg.count > 0 else {
           return
        }
        
        TCAlertUtil.showPrompt(info: msg)
    }
}
