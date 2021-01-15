//
//  TCRXBehaviorSubjectViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/15.
//

import UIKit
import RxCocoa
import RxSwift

class TCRXBehaviorSubjectViewController: TCBaseViewController {

    let disposedBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // BehaviorSubject与Subject的区别就是 后面的订阅可以接收到上一次的事件
        
        let subject = BehaviorSubject(value: 1111)
        
//        subject.onNext(0)
        subject.subscribe(onNext: {event in
            print("第一次订阅 : \(event)")
        }, onError: {error in
            print("第一次 error : \(error)")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposedBag)
        
        subject.onNext(2222)
        subject.onNext(2223)
        // 如果第一次发送错误事件后，后面的订阅不会触发onNext事件
        subject.onError(NSError(domain: "发送一个错误", code: 0, userInfo: nil))
        
        subject.subscribe(onNext: {event in
            print("第二次订阅 : \(event)")
        }, onError: {error in
            print("第二次 error : \(error)")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposedBag)
        
        
//        subject.onNext(3333)
//        subject.onCompleted()
//
//        subject.onNext(4444)
//
//        subject.subscribe(onNext: {event in
//            print("第三次订阅 : \(event)")
//        }, onError: {error in
//            print("error : \(error)")
//        }, onCompleted: {
//
//        }, onDisposed: {
//
//        }).disposed(by: disposedBag)

    }
    

}
