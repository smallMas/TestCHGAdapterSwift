//
//  TCMenuModel.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/1.
//

import UIKit
import CHGAdapter_swift

class TCMenuModel: NSObject, CHGTableViewCellModelProtocol {
    var title : String?
    var cls : UIViewController?
    var cellName : String?
    var height : CGFloat?
    
    
    init(title:String, cls:UIViewController?, cellName:String?, height:CGFloat) {
        super.init()
        self.title = title;
        self.cls = cls;
        self.cellName = cellName;
        self.height = height;
    }
    
    func cellClass(_ tableView: UITableView, indexPath: IndexPath) -> AnyClass? {
        return TCMenuTableCell.self;
    }
    
    func cellHeigh(_ tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return self.height!;
    }
}