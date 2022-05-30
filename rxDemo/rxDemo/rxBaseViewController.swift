//
//  rxBaseViewController.swift
//  rxDemo
//
//  Created by jackfrow on 2022/5/30.
//

import UIKit
import RxSwift
import RxCocoa

class rxBaseViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadLogic()
    }

    deinit {
     print("[deinit] \(self)")
    }
    
    func loadLogic()  {
        
        
        //implement by subclass.
        
    }
    
  
    

}
