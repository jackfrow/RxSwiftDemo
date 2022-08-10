//
//  TestViewController.swift
//  rxDemo
//
//  Created by jackfrow on 2022/6/23.
//

import UIKit
import RxSwift

class TestViewController: rxBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    // MARK: - loadLogic
    override func loadLogic() {
        
        let ob = Observable<Any>.create { obserber -> Disposable in
            // 3:发送信号
            obserber.onNext("test123")
            obserber.onCompleted()
            return Disposables.create()
        }
        
        let _ = ob.subscribe { text in
            print("订阅到:\(text)")
        } onError: { error in
            print("error: \(error)")
        } onCompleted: {
            print("完成")
        }

        
    }



}
