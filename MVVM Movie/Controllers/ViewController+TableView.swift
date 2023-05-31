//
//  ViewController+TableView.swift
//  MVVM Movie
//
//  Created by Nasser Mohamed on 01/05/2023.
//

import Foundation
import UIKit
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func setupTableView(){
        self.tableView.delegate=self
        self.tableView.dataSource=self
        self.tableView.backgroundColor = .clear
        self.registerCells()
    }
    
    func registerCells(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=self.cellDataSource[indexPath.row].title
        return cell
    }
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}
