//
//  ViewController.swift
//  DesignPattern
//
//  Created by czm on 2021/10/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data = ["MVC", "MVP", "MVVM"]
    
    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "设计模式"
        self.view.backgroundColor = UIColor.white
        
        
        tableView.backgroundColor = UIColor.white
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 50.0
        tableView.separatorStyle = .none
        tableView.scrollsToTop = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .gray
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        self.view.addSubview(tableView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = self.view.bounds
    }

    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 3 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") ?? UITableViewCell(style: .default, reuseIdentifier: "cellID")
        cell.selectionStyle = .none
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = MVCViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = MVPViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = VMViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
}

