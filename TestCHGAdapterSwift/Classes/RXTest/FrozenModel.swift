//
//  FrozenModel.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/15.
//

import Foundation
import CHGAdapter_swift

@frozen public struct FrozenModel : CHGTableViewCellModelProtocol {
    var name : String?
    
    public func cellClass(_ tableView: UITableView, indexPath: IndexPath) -> AnyClass? {
        return StringTableViewCell.self;
    }
    
    public func cellHeigh(_ tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return 44;
    }
}
