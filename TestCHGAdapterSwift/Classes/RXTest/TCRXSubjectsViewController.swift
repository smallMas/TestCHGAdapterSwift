//
//  TCRXSubjectsViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/15.
//

import UIKit
import RxCocoa
import RxSwift

class TCRXSubjectsViewController: TCBaseViewController {

    let disposedBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        // subjects 即使订阅者也是observable
        
        // 第一种 PublishSubjects，不需要处置就可以创建
        // 后面的订阅 不能接收之前的event
        let subject = PublishSubject<String>()
        
        subject.onNext("0000")
        subject.subscribe(onNext: {event in
            print("第一次订阅 : \(event)")
        }, onError: {error in
            print("error : \(error)")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposedBag)
        
        subject.onNext("1111")
        
        subject.subscribe(onNext: {event in
            print("第二次订阅 : \(event)")
        }, onError: {error in
            print("error : \(error)")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposedBag)
        
        
        subject.onNext("2222")
        subject.onCompleted()
        
        subject.onNext("3333")
        
        subject.subscribe(onNext: {event in
            print("第三次订阅 : \(event)")
        }, onError: {error in
            print("error : \(error)")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposedBag)
        
        subject.onNext("4444")
    }

}
