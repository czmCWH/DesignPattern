//
//  Model.swift
//  DesignPattern
//
//  Created by czm on 2021/10/18.
//

import UIKit

class VMModel: NSObject {
    
    var name: String
    
    init(_ name: String) {
        self.name = name
        super.init()
    }
}
