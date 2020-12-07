//
//  TCMenuTableCell.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/1.
//

import UIKit
import CHGAdapter_swift
import SnapKit

class TCMenuTableCell: CHGTableViewCell {

    lazy var titleLabel:UILabel = UILabel(frame: self.contentView.bounds)
    
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
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) -> Void in
            make.left.right.equalTo(self.contentView).inset(20);
            make.top.bottom.equalTo(self.contentView);
        }
    }

    // 协议
    override func cellForRowAt(indexPath: IndexPath, targetView: UIView, model: Any, eventTransmissionBlock: CHGEventTransmissionBlock?) {
        super.cellForRowAt(indexPath: indexPath, targetView: targetView, model: model, eventTransmissionBlock: eventTransmissionBlock)
        
        let tmpModel : TCMenuModel = model as! TCMenuModel
        self.titleLabel.text = tmpModel.title;
    }
}
