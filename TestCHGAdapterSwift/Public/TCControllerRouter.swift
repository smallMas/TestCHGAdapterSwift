//
//  TCControllerRouter.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/4.
//

import UIKit

typealias TCComplete = () -> Void

class TCControllerRouter: NSObject {
    static func loginLogic(userModel:TCUserModel?, target:UIViewController?, block:TCComplete?) -> Void {
        var msg : String? = nil;
        if let userModel = userModel {
            if let logOffStatus = userModel.logOffStatus, logOffStatus == TCUnregisterStatus.none {
                if let status = userModel.status, status == TCRealNameAuthStatus.already {
                    if let nickName = userModel.nickName, nickName.count > 0 {
                        if let splitEduFinishTag = userModel.splitEduFinishTag, splitEduFinishTag == TCSplitEduTag.skip {
                            // 跳过
                            if let block = block {
                                block()
                            }
                        }else {
                            // 不跳过
                            if let eduItemCount = userModel.eduItemCount, eduItemCount == 0 {
                                msg = "没有教育经历，请先添加教育经历";
                            }else {
                                if let block = block {
                                    block()
                                }
                            }
                        }
                    }else {
                        msg = "名字为空，需要进实名认证界面"
                    }
                }else {
                    msg = "账号未实名，请先实名认证"
                }
            }else {
                msg = "账号注销中"
            }
        }else {
            msg = "用户信息为空"
        }
        
        if let msg = msg {
            TCAlertUtil.showPrompt(info: msg)
        }
    }
}
