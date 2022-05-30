//
//  JRListProtocol.swift
//  JRListDemo
//
//  Created by jackfrow on 2021/11/12.
//

import Foundation
import UIKit


protocol JRModelProtocol {

    var modelCellString:String { get }
    
}

extension JRModelProtocol{
    
    var modelCellString:String {
        return "\(type(of: self))"
    }

}


protocol JRUIAttach {
    var model:JRModelProtocol? { get set }
   static func renderHeigeht() -> CGFloat
}


protocol JRCellUIAttach:UITableViewCell,JRUIAttach {
    
}









