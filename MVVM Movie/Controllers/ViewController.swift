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
    
    
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!
    //MARK: -ViewModel:
    var viewModel:MainViewModel=MainViewModel()
    
    //MARK: -variables:
    var cellDataSource :[Movie]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
        bindViewmodel()
    }
    func configView(){
        self.title = "Main View"
        
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.getdata()
    }
    func bindViewmodel(){
        viewModel.isLoading.bind{ [weak self] isLoading in
            guard let self=self, let isLoading = isLoading else{
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                    self.activityIndecator.startAnimating()
                }else{
                    self.activityIndecator.stopAnimating()
                }
            }
            
        }
        
        viewModel.cellDataSource.bind {[weak self] movies in
            guard let self=self ,let movies=movies else{
                return
            }
            self.cellDataSource=movies
            self.reloadTableView()
        }
        
    }
}

