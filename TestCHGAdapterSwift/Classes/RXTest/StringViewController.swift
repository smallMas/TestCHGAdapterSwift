//
//  StringViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/15.
//

import UIKit

class StringViewController: TCTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.tableView)
        self.tableView.cellDatas = [FrozenModel(name: "fansj")]
    }
    

}
