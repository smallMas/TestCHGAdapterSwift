//
//  TCAButton.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2020/12/3.
//

import UIKit

class TCAButton: UIButton {

    lazy var bgColorDict : Dictionary = Dictionary<String, UIColor>()
    override init(frame: CGRect) {
        super .init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackgroundColor(color:UIColor?, state:UIControl.State) -> Void {
        if (color != nil) {
            self.bgColorDict.updateValue(color!, forKey: String(format: "%d", state.rawValue));
        }else {
            self.bgColorDict.removeValue(forKey: String(format: "%d", state.rawValue))
        }
        if state == UIControl.State.normal {
            self.backgroundColor = color
        }
    }
    
    private func colorState(state:UIControl.State) -> UIColor? {
        guard let color = self.bgColorDict[String(format: "%d", state.rawValue)] else { return nil }
        return color
    }
    
    override var isHighlighted: Bool {
        willSet {
            if newValue {
                let color = colorState(state: UIControl.State.highlighted)
                if color != nil {
                    self.backgroundColor = color
                }
            }else {
                if self.isSelected == false {
                    let color = colorState(state: UIControl.State.normal)
                    if color != nil {
                        self.backgroundColor = color
                    }
                }
            }
        }
    }
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                let color = colorState(state: UIControl.State.selected)
                if color != nil {
                    self.backgroundColor = color
                }
            }else {
                if self.isSelected == false {
                    let color = colorState(state: UIControl.State.normal)
                    if color != nil {
                        self.backgroundColor = color
                    }
                }
            }
        }
    }
}
