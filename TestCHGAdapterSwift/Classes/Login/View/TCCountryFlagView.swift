//
//  TCCountryFlagView.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

class TCCountryFlagView: UIControl {
    private lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = COLHEX(s: "#1F1F1F")
        return titleLabel
    }()
    private lazy var imgView : UIImageView = UIImageView();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() -> Void {
        self.addSubview(self.titleLabel)
        self.addSubview(self.imgView)
    }
    
    func layoutUI() -> Void {
        self.titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(10);
            make.height.equalTo(21);
            make.center.equalTo(self);
        }
        
        let image : UIImage = UIImage(named: "public_right_arrow")!
        self.imgView.image = image;
        self.imgView.snp.makeConstraints { (make) in
            make.size.equalTo(image.size);
            make.left.equalTo(self.titleLabel.snp_rightMargin).offset(15);
            make.centerY.equalTo(self.titleLabel);
        }
    }
    
    // MARK: - 外部调用
    func config(phoneCode : String?, countryCode : String?, name : String?) -> Void {
        if let _ = phoneCode , let _ = name {
            let flag = TCCountryManager.sharedInstance.flag(country: countryCode ?? "")
            let string = "+"+phoneCode!+" "+flag!+" "+name!
            self.titleLabel.text = string
            
            let w = string.calculateWidth(font: self.titleLabel.font, size: CGSize.init(width: 0, height: 21))
            self.titleLabel.snp.updateConstraints { (make) in
                make.width.equalTo(w)
            }
        }else {
            self.titleLabel.text = ""
            self.titleLabel.snp.updateConstraints { (make) in
                make.width.equalTo(10)
            }
        }
    }
}
