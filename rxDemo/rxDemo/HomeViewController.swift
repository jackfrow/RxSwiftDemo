//
//  ViewController.swift
//  rxDemo
//
//  Created by jackfrow on 2022/5/30.
//

import UIKit


enum ExampleStyle:JRModelProtocol {
   case base
   case simpleValidation
    
    
    var text:String{
        switch self {
        case .base:
            return "base"
        case .simpleValidation:
            return "simpleValidation"
        }
    }
    
    var controllerId:String{
        switch self {
        case .base:
            return "BaseUseViewController"
        case .simpleValidation:
            return "SimpleValidationViewController"
        }
    }
    
}

class HomeViewController: JRListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    // MARK: - ovverider
    
    override func provideDatas() {
        
        let datas:[ExampleStyle] = [.base,.simpleValidation]
        
        self.models.append(contentsOf: datas)
        self.tableView.reloadData()
    
    }
    
    override func loadCellModelMapping() {
        
        self.register(modelClass: ExampleStyle.self, cellClass: HomeTableViewCell.self)
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
         if let m = self.modelAtIndePath(indexPath: indexPath) as? ExampleStyle {
             let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: m.controllerId)
             vc.title = m.text
             self.navigationController?.pushViewController(vc, animated: true)
             
         }
    
         
         
    }
    
}

