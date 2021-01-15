//
//  TCRxOnViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/14.
//

import UIKit
import RxCocoa
import RxSwift

class TCRxOnViewController: TCBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // doOn 是用来监听事件的生命周期，它会在每一次事件发送前被调用
        // doOn 和 subscribe是一样的
        // doOn(onNext) 会在 subscribe(onNext)前面调用
        // doOn(onCompleted) 会在 subscribe(onCompleted)前面调用
        let ob = Observable.of(1)
        
        ob.do(onNext: {event in
            print("do--> event")
        }, onError: { error in
            
        }, onCompleted: {
            
        }, onSubscribe: {
            
        }, onDispose: {
            
        }).subscribe(onNext: {event in
            print("sb--> event")
        }, onError: { error in
            
        }, onCompleted: {
            
        }, onDisposed: {
            
        })
    }
    
}
