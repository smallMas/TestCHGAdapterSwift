//
//  TCRXTextFieldViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/15.
//

import UIKit
import RxCocoa
import RxSwift

class TCRXTextFieldViewController: TCBaseViewController {
    let disposeBag = DisposeBag()
    
    lazy var textField1 : UITextField = UITextField()
    lazy var label : UILabel = UILabel()
    lazy var textLabel : UILabel = UILabel()
    lazy var button : UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
        
        // 实时显示字数
        
        // Throttling 是 RxSwift 的一个特性。因为有时当一些东西改变时，通常会做大量的逻辑操作。而使用 Throttling 特性，不会产生大量的逻辑操作，而是以一个小的合理的幅度去执行。比如做一些实时搜索功能时，这个特性很有用。
        // 注意： .orEmpty 可以将 String? 类型的 ControlProperty 转成 String，省得我们再去解包。
        // 第一种
//        let input = textField1.rx.text.orEmpty.asDriver()
//            .throttle(RxTimeInterval.microseconds(300))
//
//        input.map {
//            "当前字数 : \($0.count)"
//        }.drive(label.rx.text)
//        .disposed(by: disposeBag)
//
//        input.map {
//            $0
//        }.drive(textLabel.rx.text)
//        .disposed(by: disposeBag)
        
        // 第二种方法
        let input = textField1.rx.text.orEmpty.asObservable()
        
        input.subscribe{ event in
            print("event : \(event.element)")
        }.disposed(by: disposeBag)
        
        input.subscribe(onNext: { event in
            print("event2 : \(event)")
        }).disposed(by: disposeBag)
        
        input.map {
            "当前字数 : \($0.count)"
        }.bind(to: label.rx.text)
        .disposed(by: disposeBag)
        
        input.map{
            $0
        }.bind(to: textLabel.rx.text)
        .disposed(by: disposeBag)
        
        input.map{
            $0.count > 5
        }.bind(to: button.rx.isEnabled)
        .disposed(by: disposeBag)
    }
    
    func setupView() -> Void {
        textField1.backgroundColor = UIColor.randomColor()
        self.view.addSubview(textField1)
        textField1.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(self.view).inset(20)
            make.centerX.equalTo(self.view)
        }
        
        label.textColor = UIColor.randomColor()
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(self.textField1.snp_bottomMargin).offset(20)
            make.centerX.equalTo(self.view)
        }
        
        textLabel.textColor = UIColor.randomColor()
        self.view.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(self.label.snp_bottomMargin).offset(20)
            make.centerX.equalTo(self.view)
        }
        
        button.setTitle("按钮", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(clickTest), for: UIControl.Event.touchUpInside)
        button.backgroundColor = UIColor.randomColor()
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(self.textLabel.snp_bottomMargin).offset(20)
            make.centerX.equalTo(self.view)
        }
    }
    
    @objc func clickTest() -> Void {
        print("\(#function)")
    }
}
