//
//  TCAlertUtil.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/4.
//

import UIKit
import MBProgressHUD

class TCAlertUtil: NSObject {
    static func showPrompt(info:String) -> Void {
        let hud : MBProgressHUD = MBProgressHUD.init(view: (UIApplication.shared.keyWindow?.rootViewController?.view)!)
        hud.mode = MBProgressHUDMode.text
        hud.label.text = nil
        hud.detailsLabel.text = info
        hud.isUserInteractionEnabled = false
        hud.removeFromSuperViewOnHide = true
        
        
        hud.detailsLabel.textColor = COLHEX(s: "#FFFFFF")
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 14)
        hud.bezelView.layer.cornerRadius = 8;
        hud.minSize = CGSize(width: 160, height: 45);
        hud.bezelView.style = MBProgressHUDBackgroundStyle.solidColor
        hud.bezelView.color = COLHEX(s: "#000000", a: 0.8);
        
        UIApplication.shared.delegate?.window??.addSubview(hud)
        UIApplication.shared.delegate?.window??.bringSubviewToFront(hud)
        
        hud.show(animated: true)
        hud.hide(animated: true, afterDelay: 2)
    }
    
    static func showLoading() -> Void {
        MBProgressHUD.showAdded(to: (UIApplication.shared.delegate?.window!!)!, animated: true)
    }
    
    static func hiddenLoading() -> Void {
        MBProgressHUD.hide(for: (UIApplication.shared.delegate?.window!!)!, animated: true)
    }
}
