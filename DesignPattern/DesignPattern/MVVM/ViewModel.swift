//
//  ViewModel.swift
//  DesignPattern
//
//  Created by czm on 2021/10/18.
//
/*
 
 View Model：将 Model 转换为可在 View 上直接显示的值。通常为 class，为了方便传递时引用。
 
 处理展示的业务逻辑，包括按钮的点击，数据的请求和解析等等。
 
 */

import UIKit

class ViewModel {
    
    /// 与 视图模型 关联的VC
    weak var controller: VMViewController?
    
    /// 数据模型
    var baseModel: [VMModel] = []
    
    init(controller: VMViewController) {
        self.controller = controller
    }
    
    func httpRequest() {
        DispatchQueue.global().async {
            
            let count = Int.random(in: 1...20)
            var arr: [VMModel] = []
            for i in 0...count {
                arr.append(VMModel("第\(i)个"))
            }
            Thread.sleep(forTimeInterval: 3)
            
            DispatchQueue.main.async {
                self.baseModel = arr
                self.reloadData()
            }
        }
    }
    
    func reloadData() {
        self.controller?.collectionView.reloadData()
    }
    
}
