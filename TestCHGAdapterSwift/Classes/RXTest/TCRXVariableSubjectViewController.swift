//
//  TCRXVariableSubjectViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/15.
//

import UIKit
import RxCocoa
import RxSwift

class TCRXVariableSubjectViewController: TCBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // VariableSubject 他会把当前的值保存为自己的状态 同时它会在销毁时自动发送complete的事件
        // 本身没有 subscribe()，内部有一个 asObservable()
//        let variable = Variable("1111")
    }

}
