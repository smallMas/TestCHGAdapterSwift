//
//  TCRxSubscribeController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/14.
//

import UIKit
import RxCocoa
import RxSwift

enum MyError: Error {
    case errorA
    case errorB
}

class TCRxSubscribeController: TCBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ob = Observable.of("a","b","c")
        
        // 第一种订阅 这里打印出来的是对象
        ob.subscribe{event in
            print("event : \(event.element)")
        }
        
        // 第二种订阅,通过不同的block，回调不同的event的事件 (里面直接是值)
        ob.subscribe(onNext: {event in
            print("event2 : \(event)")
        }, onError: {error in
            
        }, onCompleted: {
            
        }, onDisposed: {
            
        })
    }
    

}
