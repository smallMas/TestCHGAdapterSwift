//
//  NSExt.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

// MARK: - NSString扩展
extension NSString {
    func calculate(font : UIFont, size : CGSize) -> CGRect {
        let rect = self.boundingRect(with: size, options: [NSStringDrawingOptions.usesLineFragmentOrigin,NSStringDrawingOptions.usesFontLeading], attributes: [NSAttributedString.Key.font : font], context: nil)
        return rect
    }
    
    func calculateWidth(font : UIFont, size : CGSize) -> CGFloat {
        let rect = self.calculate(font: font, size: size)
        return ceil(rect.size.width)
    }
    
    func calculateHeight(font : UIFont, size : CGSize) -> CGFloat {
        let rect = self.calculate(font: font, size: size)
        return ceil(rect.size.height)
    }
}
