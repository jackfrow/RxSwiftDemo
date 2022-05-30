//
//  HomeTableViewCell.swift
//  rxDemo
//
//  Created by jackfrow on 2022/5/30.
//

import UIKit

class HomeTableViewCell: JRBasicTableViewCell ,JRCellUIAttach{

    
    override var model: JRModelProtocol?{
        didSet{
            if let m = model as? ExampleStyle{
                
                self.textLabel?.text = m.text
                
            }
        }
    }
    
    static func renderHeigeht() -> CGFloat {
        return 60
    }
    

}
