//
//  Model.swift
//  DesignPattern
//
//  Created by czm on 2021/10/18.
//

/*
 
 Models 保存应用程序数据。它们通常是 struct 或 class。
 
 */

import UIKit

class VMModel: NSObject {
    
    var name: String
    
    init(_ name: String) {
        self.name = name
        super.init()
    }
}
