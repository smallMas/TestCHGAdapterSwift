//
//  TCRXExViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/14.
//

import UIKit
import RxCocoa
import RxSwift

class TCRXExViewController: TCBaseViewController {
    let disposedBag = DisposeBag()
    private lazy var mylabel : UILabel = {
        let mylabel = UILabel()
        mylabel.font = UIFont.systemFont(ofSize: 16)
        mylabel.textColor = COLHEX(s: "#1F1F1F")
        mylabel.text = "myLabel";
        return mylabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.mylabel)
        self.mylabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        let ob = Observable<Int>.interval(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
        
        // 第一种
//        ob.map{
//            CGFloat($0)
//        }
//        .bind(to: mylabel.fontSize)
//        .disposed(by: disposedBag)
        
        // 第二种
        ob
            .map{CGFloat( $0 )}//map中的类型要和绑定中的传值类型一致
            .bind(to: mylabel.rx.fontSize)
            .disposed(by: disposedBag)
    }
    
}

//// 第一种
//extension UILabel {
//    public var fontSize: Binder<CGFloat> {
//        return Binder(self){label,fontSize in
//            print("fontSize : \(fontSize)")
//            label.font = UIFont.systemFont(ofSize: fontSize)
//        }
//    }
//}

// 第二种RX的写法
extension Reactive where Base : UILabel {
    public var fontSize: Binder<CGFloat> {
        return Binder(self.base){label, fontSize in
            print("fontSize : \(fontSize)")
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
    }
}


//class aa  {
//    public func asObservable() -> Observable<Element> {
//        self.values
//    }
//}
