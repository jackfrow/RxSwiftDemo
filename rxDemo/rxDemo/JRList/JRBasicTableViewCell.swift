//
//  JRBasicTableViewCell.swift
//  JRListDemo
//
//  Created by jackfrow on 2022/5/24.
//

import UIKit

class JRBasicTableViewCell: UITableViewCell {

    var _model:JRModelProtocol?
    
    var model: JRModelProtocol? {
        get {
            return _model
        }
        set {
            _model = newValue
        }
    }

}
