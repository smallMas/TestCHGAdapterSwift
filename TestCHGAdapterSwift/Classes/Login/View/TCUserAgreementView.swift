//
//  TCUserAgreementView.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

class TCUserAgreementView: UIView {
    lazy var txtLabel : UILabel = {
        let txtLabel = UILabel.create(font: UIFont.systemFont(ofSize: 12), color: COLHEX(s: "#464646"), alignment: NSTextAlignment.center)
        txtLabel.numberOfLines = 2
        return txtLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        configData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() -> Void {
        self.addSubview(self.txtLabel)
    }
    
    func configData() -> Void {
        let tapString1 = "《DNAer用户协议》"
        let tapString2 = "《隐私政策》"
        let allString = NSString(format: "登录注册表明同意%@和%@", tapString1, tapString2)
        let range1 = allString.range(of: tapString1)
        let range2 = allString.range(of: tapString2)
        let content = NSMutableAttributedString.init(string: allString as String)
        content.addAttribute(NSAttributedString.Key.font, value: self.txtLabel.font as Any, range: NSRange(location: 0, length: allString.length))
//        content.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: range1)
        content.addAttribute(NSAttributedString.Key.foregroundColor, value: COLHEX(s: "#18609C"), range: range1)
//        content.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: range2)
        content.addAttribute(NSAttributedString.Key.foregroundColor, value: COLHEX(s: "#18609C"), range: range2)
        self.txtLabel.attributedText = content
        
        let rect = content.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 21), options: [NSStringDrawingOptions.usesLineFragmentOrigin,NSStringDrawingOptions.usesFontLeading], context: nil)
        let width = ceil(rect.size.width)
        self.txtLabel.snp.makeConstraints { (make) in
            make.height.equalTo(21);
            make.width.equalTo(width);
            make.center.equalTo(self);
        }
    }
}
