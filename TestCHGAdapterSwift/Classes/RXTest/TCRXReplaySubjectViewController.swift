//
//  TCRXReplaySubjectViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/15.
//

import UIKit
import RxCocoa
import RxSwift

class TCRXReplaySubjectViewController: TCBaseViewController {

    let disposedBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ReplaySubject buffersize 缓存前面的事件
        let subject = ReplaySubject<String>.create(bufferSize: 3) // 缓存最新的3个事件
        
        subject.onNext("11")
        subject.onNext("12")
        subject.onNext("13")
        
        subject.subscribe(onNext: {event in
            print("第一次event : \(event)")
        }, onError: {error in
            print("第一次error : \(error)")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposedBag)
        
        subject.onNext("14")
        subject.subscribe(onNext: {event in
            print("第二次event : \(event)")
        }, onError: {error in
            print("第二次error : \(error)")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposedBag)
        
        subject.onCompleted()
        
        subject.subscribe(onNext: {event in
            print("第三次event : \(event)")
        }, onError: {error in
            print("第三次error : \(error)")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposedBag)
    }
    
}
