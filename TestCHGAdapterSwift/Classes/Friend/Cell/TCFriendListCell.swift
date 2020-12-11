//
//  TCFriendListCell.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/8.
//

import UIKit
import CHGAdapter_swift
import SDWebImage

class TCFriendListCell: TCBaseTableCell {
    
    private lazy var headView : UIImageView = UIImageView()
    private lazy var nameLabel:UILabel = {
        var label = UILabel.create(font: UIFont.boldSystemFont(ofSize: 14), color: COLHEX(s: "#464646"))
        return label
    }()
    private lazy var detailLabel:UILabel = {
        var label = UILabel.create(font: UIFont.systemFont(ofSize: 12), color: COLHEX(s: "#979797"))
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() -> Void {
        self.headView.contentMode = UIView.ContentMode.scaleAspectFill
        self.headView.layer.cornerRadius = 20
        self.headView.layer.masksToBounds = true
        self.contentView.addSubview(self.headView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.detailLabel)
        self.headView.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
            make.left.equalTo(20)
            make.centerY.equalTo(self.contentView)
        }
        
        let nameH = 18.0
        let detailH = 12.0
        let spaceH = 7.0
        self.nameLabel.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(self.contentView).inset(20)
            make.left.equalTo(self.headView.snp.right).offset(10)
            make.height.equalTo(nameH)
            make.centerY.equalTo(self.contentView).offset(-(detailH+spaceH)/2.0)
        }
        
        self.detailLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.nameLabel)
            make.height.equalTo(detailH)
            make.centerY.equalTo(self.contentView).offset((nameH+spaceH)/2.0)
        }
    }
    
    // 协议
    override func cellForRowAt(indexPath: IndexPath, targetView: UIView, model: Any, eventTransmissionBlock: CHGEventTransmissionBlock?) {
        super.cellForRowAt(indexPath: indexPath, targetView: targetView, model: model, eventTransmissionBlock: eventTransmissionBlock)

        let tmpModel : TCFriendModel = model as! TCFriendModel
        if let exts = tmpModel.exts, let avatar = exts.avatar {
            self.headView.tc_setHeaderImage(url: avatar)
        }
        self.nameLabel.text = tmpModel.finalShowName;
        self.detailLabel.text = tmpModel.tagsString()
    }
}
