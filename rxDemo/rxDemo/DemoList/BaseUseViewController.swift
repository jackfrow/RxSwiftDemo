//
//  BaseViewController.swift
//  rxDemo
//
//  Created by jackfrow on 2022/5/30.
//

import UIKit
import RxSwift
import RxCocoa


class BaseUseViewController: rxBaseViewController {

    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    
    override func loadLogic() {
    
    
//        Target Action
        self.btn.rx.tap.subscribe { _ in
            print("btn tap")
        }.disposed(by: disposeBag)

//        代理
        self.scrollView.rx.contentOffset.subscribe { point in
            print("point \(point)")
        }.disposed(by: disposeBag)
        
        
//        通知
        NotificationCenter.default.rx
            .notification(UIApplication.willEnterForegroundNotification)
            .subscribe(onNext: { (notification) in
                print("Application Will Enter Foreground")
            })
            .disposed(by: disposeBag)

        
    }
    
    
    


}
