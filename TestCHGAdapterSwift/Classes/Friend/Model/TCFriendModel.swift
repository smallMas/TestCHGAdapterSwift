//
//  TCFriendModel.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/8.
//

import UIKit
import HandyJSON
import CHGAdapter_swift

class TCFriendModel: TCBaseModel {
    // 好友来源
    enum Source:String,HandyJSONEnum {
        // 搜索
        case search = "1"
        // 互相关注
        case eachFocus = "2"
        // 通讯录
        case addressbook = "3"
    }
    
    // 邀请状态
    enum RegisterStatus:Int,HandyJSONEnum {
        // 未邀请
        case unInvited = 0
        // 已邀请
        case invited = 1
        // 已注册（好友）
        case friended = 2
    }
    
    // 好友状态
    enum RelationStatus:Int,HandyJSONEnum {
        // 正常好友
        case normal = 1
        // 黑名单
        case black = 2
    }
    
    // 好友用户编号
    var friendUserId : String?
    // 好友关系编号
    var friendsId : String?
    // 用户编号
    var userId : String?
    // 好友来源 1：搜索  2：互相关注  3：通讯录
    var source : Source?
    // 好友备注
    var remarks : String?
    // 最终显示
    var finalShowName : String?
    // 标签
    var tags : String?
    // 标签数组
    var _tagArray : Array<TCFriGroupModel>?
    // 字母开头
    var firstLetter : String?
    // 手机号
    var phoneNum : String?
    // 邀请状态
    var inviteStatus : RegisterStatus?
    // 用户信息
    var exts : TCUserModel?
    // 用户状态
    var relationStatus : RelationStatus?
    
    // 获取tag array
    func getTagArray() -> Array<TCFriGroupModel>? {
        if _tagArray == nil,let tags = tags {
//            _tagArray = JSONDeserializer<Array<TCFriGroupModel>>.deserializeFrom(json: tags)
            if let jsonData = tags.data(using: .utf8){
                _tagArray = try?JSONDecoder().decode(Array<TCFriGroupModel>.self, from: jsonData)
            }
        }
        return _tagArray
    }
}

extension TCFriendModel: CHGTableViewCellModelProtocol {
    // CHGTableViewCellModelProtocol协议
    func cellClass(_ tableView: UITableView, indexPath: IndexPath) -> AnyClass? {
        return TCFriendListCell.self;
    }
    
    func cellHeigh(_ tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        return 79.0;
    }
    
    func tagsString() -> String {
        var str : String = ""
        var count = 0
        let tagArray = self.getTagArray()
        if let tags = tagArray {
            if tags.count > 2 {
                count = 2
            }else {
                count = tagArray!.count
            }
        }
        for index in 0..<count {
            let model = tagArray![index]
            if let userTagName = model.userTagName {
                if index == 0 {
                    str = userTagName
                }else {
                    str = str + "、"+userTagName
                }
            }
        }
        return str
    }
}

class TCFriGroupModel: TCBaseModel,Decodable {
    // 分组类型
    enum TagType:Int,HandyJSONEnum,Decodable {
        // 默认分组
        case def = 0
        // 自定义分组
        case custom = 1
    }
    
    // 分组编号
    var userTagId : String?
    // 分组名称
    var userTagName : String?
    // 版本号
    var systemVersion : String?
    // 分组排序
    var userTagSort : String?
    // 分组类型（0，系统分组 1，自定义分组）
    var userTagType : TagType?
    // 分组下用户
    var tagUser : Array<String>?
    // 分组成员字符串
    var title : String?
    // 用户数量
    var userCount : Int?;
}
