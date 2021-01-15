//
//  TCRXObservableOfController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/8.
//  Observable.of自动发送completed事件

import UIKit
import RxCocoa
import RxSwift

class TCRXObservableOfController: TCBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 我们可以使用 doOn 方法来监听事件的生命周期，它会在每一次事件发送前被调用。
        

        let observable = Observable.of("a","b","c")
        let subscribe = observable.subscribe{event in
            print(event)
        }
        subscribe.dispose()
        
//        observable.do(onNext :{event in
//            print("do \(event)")
//        }).subscribe{event in
//            print("subscribe : \(event)")
//        }
        
        // just方法需要一个初始值
        let ob = Observable<String>.just("5")
        // of方法可以接受可变数量的参数
        let ob2 = Observable.of("a","b","c","d")
        // from方法需要一个数组
        let ob3 = Observable.from(["a","b","c"])
        // empty方法 空内容的序列
        let ob4 = Observable<Int>.empty()
        // never方法 永远不会发出event，也不会终止
        let ob5 = Observable<Int>.never()
        // error方法
        let ob6 = Observable<MyError>.error(MyError.errorA)
        // rang方法 创建一个范围的序列 效果与Observable.of(1,2,3,4,5)是一样的
        let ob7 = Observable.range(start: 1, count: 5)
        // repeatElement方法 无限发出给定元素的event，永不终止
        let ob8 = Observable.repeatElement(1)
        // generate方法 判断条件为true，才会执行序列
        let ob9 = Observable.generate(initialState: 0, condition: {$0 >= 10}, iterate: {$0 + 2})
    }
}
