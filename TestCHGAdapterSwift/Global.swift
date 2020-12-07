//
//  Global.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/1.
//

import UIKit

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kStatusHeight = UIApplication.shared.statusBarFrame.size.height
let kNavigationHeight = 44
let kSafeAreaEdgeInsets:UIEdgeInsets = {
    guard #available(iOS 11.0, *), let safeAreaInsets = UIApplication.shared.delegate?.window??.safeAreaInsets else {
        return UIEdgeInsets()
    }
    return safeAreaInsets
}()
let kSafeTopHeight = kStatusHeight
let kSafeBottomHeight = kSafeAreaEdgeInsets.bottom


// 通知
let kNoticeRegisterLogin = "NoticeRegisterLogin"


//func DLLog<T>(message: T, fileName: String = #file, funcName: String = #function, lineNum : Int = #line) {
//    
//    #if DEBUG
//        /**
//         * 此处还要在项目的build settings中搜索swift flags,找到 Other Swift Flags 找到Debug
//         * 添加 -D DEBUG,即可。
//         */
//         // 1.对文件进行处理
//        let file = (fileName as NSString).lastPathComponent
//        // 2.打印内容
//        print("[\(file)][\(funcName)](\(lineNum))\(message)")
//        
//    #endif
//    
//}
