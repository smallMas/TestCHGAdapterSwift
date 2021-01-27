//
//  StringTableViewCell.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/15.
//

import UIKit
import CHGAdapter_swift

class StringTableViewCell: CHGTableViewCell {

    // 协议
    override func cellForRowAt(indexPath: IndexPath, targetView: UIView, model: Any, eventTransmissionBlock: CHGEventTransmissionBlock?) {
        super.cellForRowAt(indexPath: indexPath, targetView: targetView, model: model, eventTransmissionBlock: eventTransmissionBlock)
        
        let tmpModel : FrozenModel = model as! FrozenModel
        self.textLabel?.text = tmpModel.name;
    }
}
