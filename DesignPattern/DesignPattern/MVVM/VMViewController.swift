//
//  VMViewController.swift
//  DesignPattern
//
//  Created by czm on 2021/10/18.
//
// https://github.com/pro648/tips/blob/master/sources/MVVM设计模式.md
// https://www.objc.io/issues/13-architecture/mvvm/
// iOS 上 MVVM 背后的动机是它降低了一个 controller 的复杂性，并使一个人的表现逻辑更容易测试。
// 当模型需要转换后才可以在视图显示时，使用 MVVM。

/*
 
 Controller：处理 viewDidLoad；View生命周期事件；通过 IBAction 和其它任务处理 View 回调。
 
 View：在屏幕上显示视觉元素和控件，通常为UIView的子类。
 
 */


import UIKit

class VMViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    lazy var vmModel: ViewModel = {
        let model = ViewModel(controller: self)
        return model
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 80, height: 80)
        flowLayout.minimumLineSpacing = 15
        flowLayout.minimumInteritemSpacing = 24
        flowLayout.headerReferenceSize = .zero
        flowLayout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "MVVM"
        self.view.backgroundColor = UIColor.white
        
        collectionView.register(VMViewCell.self, forCellWithReuseIdentifier: VMViewCell.reuseIdentifier)
        self.view.addSubview(collectionView)
        
        self.vmModel.httpRequest()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.collectionView.frame = self.view.bounds
    }
    
    deinit {
        print("====", (#file as NSString).lastPathComponent, #function)
    }
    
    // MARK: -  UICollectionViewDataSource, UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.vmModel.baseModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VMViewCell.reuseIdentifier, for: indexPath) as! VMViewCell
        cell.titleLabel.text = self.vmModel.baseModel[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.vmModel.httpRequest()
    }

}
