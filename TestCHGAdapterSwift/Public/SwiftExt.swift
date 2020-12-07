//
//  SwiftExt.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

// MARK: - NSString扩展
extension String {
    // MARK: - 计算文本
    func calculate(font : UIFont, size : CGSize) -> CGRect {
        let text = self as NSString
        return text.calculate(font: font, size: size)
    }
    
    func calculateWidth(font : UIFont, size : CGSize) -> CGFloat {
        let text = self as NSString
        return text.calculateWidth(font: font, size: size)
    }
    
    func calculateHeight(font : UIFont, size : CGSize) -> CGFloat {
        let text = self as NSString
        return text.calculateHeight(font: font, size: size)
    }
    
    // MARK: - 正则
    func checkPredicate(string:String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", string)
        return predicate.evaluate(with: self)
    }
    
    // 校验手机号
    func isMobilePhone() -> Bool {
        let string = "^1[0-9][0-9]\\d{8}"
        return self.checkPredicate(string: string)
    }
}
