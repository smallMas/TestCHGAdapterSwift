//
//  TCUserModel.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit
import HandyJSON

enum TCUnregisterStatus:Int,Codable,HandyJSONEnum {
    // 没有注销过
    case none = 0
    // 已申请了注销
    case applyed = 1
}

enum TCRealNameAuthStatus:Int,Codable,HandyJSONEnum {
    // 默认
    case defaultNone = 0
    // 未实名
    case not = 1
    // 已实名
    case already = 2
    // 禁用
    case disable = 3
    // 审核中
    case ing = 4
    // 失败
    case fail = 5
}

enum TCSplitEduTag:Int,Codable,HandyJSONEnum {
    // 不跳过
    case notSkip = 0
    // 跳过
    case skip = 1
}

// 教育经历-学历类型
enum TCEduLevelType:Int,Codable,HandyJSONEnum {
    // 小学
    case primary = 1
    // 初中
    case juniorHigh = 2
    // 高中
    case high = 3
    // 大专
    case college = 4
    // 本科
    case undergraduate = 5
    // 硕士
    case master = 6
    // 博士
    case dr = 7
    // 其他
    case other = 8
};

class TCUserModel: TCBaseModel,Codable {
    var dId : String?
    var yxToken : String?
    var agoraToken : String?
    var agoraSinglingToken : String?
    var rtmAgoraSinglingToken : String?
    var otherId : String?
    var token : String?
    var userId : String?
    var logOffStatus : TCUnregisterStatus?
    var status : TCRealNameAuthStatus?
    var splitEduFinishTag : TCSplitEduTag?
    var eduItemCount : Int? // 教育经历个数
    var nickName : String?
    var avatar : String?
    var countryCode : String?
    var city : String?
    var nativePlace : String?
    var sex : Int?
    var name : String?
    var statusTag : String?
    var remarks : String?
    var finalShowName : String?
    var finalTagInfo : String?
    var userEduItem : TCEduExpModel?
    var userWorkItem : DNWorkExpModel?
    // 大学生认证状态(1：未认证 2 ：已认证 3：其他)
    var collegeStudentAuth : Int?
    var userLabels : Array<String>?
    
//    userLabels
//    hobbies
//    userEduItem
//    userWorkItem
    required init() {
        
    }
}

class TCEduExpModel:TCBaseModel,Codable  {
    /// 版本号
    var systemVersion : String?;
    /// 用户教育经历编号
    var userEduItemId : String?;
    /// 学历1小2初3高4专5本6硕7博士8其它
    var eduLevelType : TCEduLevelType?
    /// 学校名称
    var schoolName : String?
    /// 学校code
    var code : String?
    /// 开始日期
    var eduStartDate : String?
    /// 结束日期
    var eduEndDate : String?
    /// 谁可以看
    var eduWhoCanSee : String?
    /// 专业
    var major : String?
    /// 院系
    var college : String?
    var token : String?
    /// 入学时间设置权限 1、公开 2、私密 3、好友可见
    var startSchoolScope : Int?
}

class DNWorkExpModel:TCBaseModel,Codable  {
    // 职位名称
    var positionName : String?
    // 公司名称
    var companyName : String?
    // 备注
    var remarks : String?
    // 开始日期
    var workStartDate : String?
    // 结束日期
    var workEndDate : String?
    // 谁可以看
    var power : Int?
    // 是否是至今，值为true的情况，才是至今，false 或者空，都不是
    var isToCurrentDay : Bool?
    // 用户工作经历编号
    var userWorkItemId : String?
    // 用户编号
    var userId : String?
    // 版本号
    var systemVersion : String?
}
