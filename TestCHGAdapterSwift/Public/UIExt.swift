//
//  UIExt.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

func COLHEX(s:String) -> UIColor {
    return UIColor(hexString: s, alpha: 1.0)
}

func COLHEX(s:String, a:CGFloat) -> UIColor {
    return UIColor(hexString: s, alpha: a)
}


// MARK: - Color 扩展
extension UIColor {
    public static func randomColor() -> UIColor {
        return UIColor(red: randomColorCount(0, 256)/255.0, green: randomColorCount(0, 256)/255.0, blue: randomColorCount(0, 256)/255.0, alpha: 1.0)
    }
    
    private static func randomColorCount(_ startIndex:Int, _ endIndex:Int) -> CGFloat{
        let range = Range<Int>(startIndex...endIndex)
        let count = UInt32(range.upperBound - range.lowerBound)
        let v = Int(arc4random_uniform(count))+range.lowerBound
        return CGFloat(v)
    }
    
    public static func colorWithRGBHex(_ hex: UInt32) -> UIColor {
        let r = (hex >> 16) & 0xFF
        let g = (hex >> 8) & 0xFF
        let b = (hex) & 0xFF
        return UIColor(red: CGFloat(r) / CGFloat(255.0), green: CGFloat(g) / CGFloat(255.0), blue: CGFloat(b) / CGFloat(255.0), alpha: 1.0)
    }
    
    // Hex String -> UIColor
    convenience init(hexString: String, alpha: CGFloat) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
         
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
         
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
         
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
         
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
         
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
     
    // UIColor -> Hex String
    var hexString: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
         
        let multiplier = CGFloat(255.999999)
         
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
         
        if alpha == 1.0 {
            return String(
                format: "#%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        }
        else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier),
                Int(alpha * multiplier)
            )
        }
    }
}


// MARK: - UIButton 扩展
extension UIButton {
    static func create(type:UIButton.ButtonType, targe:Any, action:Selector) -> UIButton {
        let btn = UIButton(type: type)
        btn.addTarget(targe, action: action, for: UIControl.Event.touchUpInside)
        return btn
    }
}


// MARK: - UILabel 扩展
extension UILabel {
    static func create(font:UIFont, color:UIColor, alignment:NSTextAlignment) -> UILabel {
        let label = self.create(font: font, color: color)
        label.textAlignment = alignment
        return label
    }
    static func create(font:UIFont, color:UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = color
        return label
    }
}

// MARK: - UIApplication 扩展
extension UIApplication {
    // 获取当前controller
    func currentController() -> UIViewController? {
        guard let window = self.delegate?.window else {
            return nil
        }
        
        var normalWindow = window!
        if normalWindow.windowLevel != UIWindow.Level.normal {
            let windows = self.windows as NSArray
            windows.enumerateObjects { (obj, idx, stop) in
                let window = obj as! UIWindow
                if window.windowLevel == UIWindow.Level.normal {
                    normalWindow = window
                    stop.initialize(to: true)
                }
            }
        }
        guard let rootViewController = normalWindow.rootViewController else {
            return nil
        }
        return self.nextTopFor(inViewController: rootViewController)
    }
    
    private func nextTopFor(inViewController:UIViewController?) -> UIViewController? {
        guard let t = inViewController else {
            return nil
        }
        var tempController = t
        while let vc = tempController.presentedViewController {
            tempController = vc
        }
        
        if tempController is UITabBarController {
            let selectedVC = self.nextTopFor(inViewController: (tempController as! UITabBarController).selectedViewController)
            return selectedVC
        }else if tempController is UINavigationController {
            let selectedVC = self.nextTopFor(inViewController: (tempController as! UINavigationController).visibleViewController)
            return selectedVC;
        }else {
            return tempController
        }
    }
}
