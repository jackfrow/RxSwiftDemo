//
//  BaseViewController.swift
//  rxDemo
//
//  Created by jackfrow on 2022/5/30.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture


class BaseUseViewController: rxBaseViewController {

    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        loadLogic()
        
    }
    
    
    override func loadLogic() {
    
        var arr = [1,2,3,4,5]
        
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
        
        
    
        
        
//        let v = UIView()
        self.view.rx.tapGesture().when(.recognized).subscribe { _ in
         
            
            
        }
        
//        let l = UILabel()
        

        
    }
    
    
    


}
