//
//  TCOtherViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/18.
//

import UIKit
import RxCocoa
import RxSwift

enum YiHuo : UInt8{
    case a = 0x0
    case b = 0x1
    case c = 0x2
}


enum VNodeFlags : UInt32 {
    case Delete = 0x00000001
    case Write = 0x00000002
    case Extended = 0x00000004
    case Attrib = 0x00000008
    case Link = 0x00000010
    case Rename = 0x00000020
    case Revoke = 0x00000040
    case None = 0x00000080

}

class TCOtherViewController: TCBaseViewController {

    let disposedBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.rx.viewWillAppear.subscribe(onNext: {event in
           print("event : \(event)")
        }).disposed(by: disposedBag)
        
        var p = Person()
        
        p.progressOb.subscribe(onNext: { event in
            print("xx : \(event)")
        }).disposed(by: disposedBag)
        
        p.progress = 0.4;
        p.progress = 0.42;
        p.progress = 0.43;
        p.progress = 0.45;
        
        print("p.progress : \(p.progress)")
        // Do any additional setup after loading the view.
//        func swap( a: inout Int, b: inout Int) {
//            let temp = a
//            a = b
//            b = temp
//        }
//        var a = 1
//        var b = 2
//        print(a, b)// 1 2
//        swap(a: &a, b: &b)
//        print(a, b)// 2 1
        
        
//        let a = [2,3,4].map{ a in
//            a*2
//        }
//        print("a : \(a)")
        
        // fun a * b  a + b
        
//        let a1 = YiHuo.b | YiHuo.c
//        print("a1 : \(a1)")
//        if a1.HashFlag(YiHuo.b) {
//            print("ddddd")
//        }
        
//        let firstBit: UInt8 = 0b10000000
//        let lastBit: UInt8  = 0b00000001
//        let invertedBits = ~lastBit  // 等于 0b11111110
//        let noneBit = firstBit & lastBit  // 等于 0b00000000
//        let twoSideBits = firstBit | lastBit //等于 0b10000001
        
//        let a1 = VNodeFlags.Link | VNodeFlags.Delete
//        print("a1 : \(a1)")
        
//        UIViewAutoresizingFlexibleWidth
//        NSCalendarUnitYear
        
//        let a = NSCalendar.Unit.year | NSCalendar.Unit.month
//        print("a : \(a)")
//        UIViewAnimationOptionAllowUserInteraction
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
}


open class Person : NSObject {
    var progress : Float = 0.0 {
        didSet {
            rx_progress.onNext(progress)
        }
    }
    
    private var rx_progress = PublishSubject<Float>()
    var progressOb : Observable<Float> {
        return rx_progress.asObservable()
    }
    
    var value : String?
}


extension Reactive where Base : Person {
//    public var progress : ControlProperty<Float> {
////        let source = Observable.deferred { [weak p = self.base]() -> Observable<Float> in
////            return Observable.of(p?.progress ?? 0).startWith((p?.progress)!)
////        }
//        let source = Observable.of(self.progress)
//        
////        let observer = Binder(self.base) { (person , value : Float?) in
////            person.progress = value ?? 0
////        }
//        
//        let observer = Binder(self.base){p, value in
//            p.progress = value
//        }
//        ControlProperty(values: source, valueSink: observer)
//        return ControlProperty(values: source, valueSink: observer.asObserver())
//    }
    
//    public var value : ControlProperty<String> {
////        let source = self.rx.mapObserver()
//        let source = Observable.of(self.value)
//        let observer = Binder(self.base){p, value in
//            value as? String ?? ""
//            p.value = value
//        }
//        return ControlProperty(values: source, valueSink: observer)
//    }
}

//extension Reactive where Base: NSTextField {
//
//    /// Reactive wrapper for `delegate`.
//    ///
//    /// For more information take a look at `DelegateProxyType` protocol documentation.
//    public var delegate: DelegateProxy<NSTextField, NSTextFieldDelegate> {
//        RxTextFieldDelegateProxy.proxy(for: self.base)
//    }
//
//    /// Reactive wrapper for `text` property.
//    public var text: ControlProperty<String?> {
//        let delegate = RxTextFieldDelegateProxy.proxy(for: self.base)
//
//        let source = Observable.deferred { [weak textField = self.base] in
//            delegate.textSubject.startWith(textField?.stringValue)
//        }.take(until: self.deallocated)
//
//        let observer = Binder(self.base) { (control, value: String?) in
//            control.stringValue = value ?? ""
//        }
//
//        return ControlProperty(values: source, valueSink: observer.asObserver())
//    }
//
//}

public extension Reactive where Base:UIViewController {
    public var viewWillAppear: ControlEvent<Bool> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear(_:))).map{
            $0.first as? Bool ?? false
        }
        return ControlEvent(events: source)
    }
}
