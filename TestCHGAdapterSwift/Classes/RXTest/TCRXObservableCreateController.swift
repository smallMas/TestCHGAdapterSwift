//
//  TCRXObservableCreateController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/8.
//

import UIKit
import RxCocoa
import RxSwift

class TCRXObservableCreateController: TCBaseViewController {
    var observable : Observable<String>?
    
    //负责对象销毁
    let disposeBag = DisposeBag()
    
    lazy var btn:UIButton = UIButton(type: UIButton.ButtonType.custom)
//    UIButton.create(type: UIButton.ButtonType.custom, targe: self, action: #selector(tapClick))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView();
        
        observable = Observable<String>.create{observer in
            //对订阅者发出了.next事件，且携带了一个数据"hangge.com"
            observer.onNext("hangge.com")
            //对订阅者发出了.completed事件
            observer.onCompleted()
            //因为一个订阅行为会有一个Disposable类型的返回值，所以在结尾一定要returen一个Disposable
            return Disposables.create()
        }
         
        //订阅测试
        if let observable = observable {
            observable.subscribe {
                print(" : \($0)")
            }
            
            observable.subscribe { (event) in
                print("event : \(event)")
            }
        }
        
        //延时5秒种后，每隔1秒钟发出一个元素 // MainScheduler.instance:表示主线程
        let observable2 = Observable<Int>.timer(RxTimeInterval.seconds(5), period: RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
        observable2.subscribe { event in
            print(event)
        }.disposed(by: disposeBag)
    }
    
    @objc func tapClick() -> Void {

    }
    
    func setupView() -> Void {
        self.btn.backgroundColor = COLHEX(s: "#FF00FF")
        self.view.addSubview(self.btn)
        self.btn.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }
        self.btn.rx.tap.subscribe(onNext:{ event in
            print("event : \(event)")
        })
    }
    deinit {
        print("\(self.self) deinit")
    }
}
