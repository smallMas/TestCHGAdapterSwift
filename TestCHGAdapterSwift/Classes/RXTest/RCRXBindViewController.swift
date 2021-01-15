//
//  RCRXBindViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/14.
//

import UIKit
import RxCocoa
import RxSwift

class RCRXBindViewController: TCBaseViewController {
    let disposedBag = DisposeBag()
    private lazy var mylabel : UILabel = {
        let mylabel = UILabel()
        mylabel.font = UIFont.systemFont(ofSize: 16)
        mylabel.textColor = COLHEX(s: "#1F1F1F")
        return mylabel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.mylabel)
        self.mylabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }

        // 观察者 AnyObserver所有场景都可以
        let observer : AnyObserver<String> = AnyObserver{ [weak self] event in
            print("event : \(event)")
            switch event {
            case .next(let text):
                self?.mylabel.text = text
                break
            default:
                break
            }
        }
        observer.onNext("aaa")
//
//        let observable = Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
//        observable.map{
//            "当前索引:\($0)"
//        }.bind(to: observer)
//        .disposed(by: disposedBag)
        
        
//        // 第二种观察者Binder，用于特定场景
//        // 1、不会处理错误事件
//        // 2、确保绑定都是在给定的线程
//        let binderServer : Binder<String> = Binder(mylabel) { (lab, text) in
//            lab.text = text
//        }
//        let observable2 = Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
//        observable2.map{
//            "当前Index:\($0)"
//        }.bind(to: binderServer)
//        .disposed(by: disposedBag)
        
        
//        // 第三种观察者RX，已经实现了观察者
//        let observable3 = Observable<Int>.interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
//        observable3.map{
//            "第三种当前:\($0)"
//        }.bind(to: mylabel.rx.text)
//        .disposed(by: disposedBag)
    }
    
}
