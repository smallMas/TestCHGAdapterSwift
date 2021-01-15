//
//  TCRXDisposeViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/14.
//

import UIKit
import RxCocoa
import RxSwift

class TCRXDisposeViewController: TCBaseViewController {

    let disposedBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let ob = Observable.of(1,2,3)
        
        // 手动释放
        let sub = ob.subscribe{ event in
            print(event)
        }
        sub.dispose()
        
        // 自动释放
        sub.disposed(by: disposedBag)
    }

}
