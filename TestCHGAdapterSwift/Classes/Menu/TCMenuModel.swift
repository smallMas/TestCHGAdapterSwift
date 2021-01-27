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
    var cls : AnyClass?
    var cellName : String?
    var height : CGFloat?
    var type : Int?
    
    
    init(title:String, cls:AnyClass?, cellName:String?, height:CGFloat) {
        super.init()
        self.title = title;
        self.cls = cls;
        self.cellName = cellName;
        self.height = height;
    }
    
    init(title:String, type:Int?, cellName:String?, height:CGFloat) {
        super.init()
        self.title = title;
        self.type = type;
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
