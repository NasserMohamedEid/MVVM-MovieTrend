//
//  ViewController.swift
//  MVVM Movie
//
//  Created by Nasser Mohamed on 30/04/2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -IBoutlets:
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: -ViewModel:
    var viewModel:MainViewModel=MainViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
        
    }
    func configView(){
        self.title = "Main View"
        
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.getdata()
    }
}

