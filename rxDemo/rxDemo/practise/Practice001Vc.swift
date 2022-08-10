//
//  Practice001Vc.swift
//  rxDemo
//
//  Created by jackfrow on 2022/7/4.
//

import UIKit
import RxSwift
import RxCocoa

class Practice001Vc: rxBaseViewController {

    
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var nameTip: UILabel!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var passwordTip: UILabel!
    
    
    @IBOutlet weak var confirm: UIButton!
    
    let relay = PublishRelay<String>.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
//        test01()
//        test02()
//        test03()
//        test04()
        test06()

    }
    
    
    func test01()  {
        
        relay.subscribe { testString in
            print("test string \(testString)")
        } onError: { error in
            
        } onCompleted: {
            
        }.disposed(by: disposeBag)
        
    }
    
    
    func test02()  {
        
        let numbers:Observable<Int> = Observable.create { observer -> Disposable in
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onNext(4)
            observer.onNext(5)
            observer.onCompleted()
            return Disposables.create()
            
        }
        
        numbers.subscribe { a in
            print("content a \(a)")
        } onError: { error in
            print("error")
        } onCompleted: {
            print("complete")
        }.disposed(by: disposeBag)

        
    }
    
    
    /// Single
    func test03()  {
        
        let single = Single<Int>.create { single in
            single(.success(8))
            single(.success(9))
            single(.success(7))
            return Disposables.create()
        }
        
        single.subscribe { result in
            print("success result \(result)")
        } onFailure: { error in
            print("failed")
        }.disposed(by: disposeBag)
    

        
    }
    
    
    /// Completable
    func test04()  {
        
        let complete = Completable.create { complete in
            
            complete(.completed)
            return Disposables.create {}
            
        }
        
        complete.subscribe {
            print("complete success")
        } onError: { error in
            print("complete error \(error)")
        }.disposed(by: disposeBag)

    }
    
    
//    Maybe
    func test05()  {
        
    
        let maybe = Maybe<String>.create { maybe in
            
            maybe(.success("RxSwift"))

            // OR

//            maybe(.completed)

            // OR

//            maybe(.error(error))

            return Disposables.create {}
            
        }
        
        
        maybe.subscribe { success in
            print("maybe success \(success)")
        } onError: { error in
            print("maybe error \(error)")
        } onCompleted: {
            print("maybe complete")
        }.disposed(by: disposeBag)
        
    }
    
    func test06()  {
        
        let any = AnyObserver<Int>.init { event in
            
            switch event {
            case .next(let a):
              print("next \(a)")
            case .error(let error):
                print("error \(error)")
            default: break
            
            }
            
        }
        
        let ob = Observable<Int>.create { ob in
            ob.onNext(5)
            ob.onNext(8)
            ob.onCompleted()
            return Disposables.create {}
        }
        
        
        ob.bind(to: any).disposed(by: disposeBag)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        relay.accept("jj")
        
    }
    
    override func loadLogic() {
        
        
        //获取name 文字序列
        let nameText = nameInput.rx.text
        let nameVadlid = nameText.map({$0!.count > 6})
        nameVadlid.bind(to: self.nameTip.rx.isHidden).disposed(by: disposeBag)
        
        
        //获取password 序列
        let passworText = passwordInput.rx.text
        let passwordVadlid = passworText.map({$0!.count > 6})
        passwordVadlid.bind(to: self.passwordTip.rx.isHidden).disposed(by: disposeBag)
    
        
        let allValid = Observable.combineLatest(nameVadlid, passwordVadlid) { $0 && $1 } // 取用户名和密码同时有效
            .share(replay: 1)

        allValid.bind(to: self.confirm.rx.isEnabled).disposed(by: disposeBag)
        self.confirm.rx.tap.subscribe { _ in
            print("confirm btn click.")
        } onError: { error in
        } onCompleted: {
        }.disposed(by: disposeBag)
        }
    
    
   
    
    

    
        
}
