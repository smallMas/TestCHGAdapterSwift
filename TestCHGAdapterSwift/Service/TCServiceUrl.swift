//
//  TCServiceUrl.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/1.
//

import UIKit

let TCBaseUrl = "https://api.dnaerapp.com"


// MARK: - 登录模块
// 发送验证码
let TC_SendValidateCode = "/user/user/mobile/v1/phoneInput/step1/phoneNum/validate"
// 校验注册验证码
let TC_CheckValidateCode = "/user/user/mobile/v1/phoneInput/step2/phoneCode/check"

// MARK: - 资产
// 获取本人的用户主页信息
let TC_MineHomePage = "/user/user/mobile/v1/self/home";

// MARK: - 测试接口
let TC_IpCountryCode = "/user/user/mobile/v1/find/country/code/ip"
let TC_PrivacyNotice = "/user/privacy/notice/log/mobile/v1/find"

func interfaceUrl(string:String) -> String {
    let url = TCBaseUrl+string
    return url
}

class TCServiceUrl: NSObject {

}
