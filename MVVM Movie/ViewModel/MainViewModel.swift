//
//  MainViewModel.swift
//  MVVM Movie
//
//  Created by Nasser Mohamed on 01/05/2023.
//

import Foundation
class MainViewModel{
    
    
    var isLoading:Observale<Bool>=Observale(false)
    var cellDataSource:Observale<[Movie]>=Observale(nil)
    var dataSource:TrendingMovieModel?
    func numberOfSections()->Int{
       1
    }
    func numberOfRows(in section:Int)->Int{
        self.dataSource?.results.count ?? 0
    }
    func getdata(){
        
        if isLoading.value ?? true{
            return
        }
        
        isLoading.value=true
        APICaller.getTrendingMovie { [weak self] result in
            
            self?.isLoading.value=false
            
            switch result{
            case.success(let data ):
                print(data.results.count)
                self?.dataSource=data
                self?.mapCellData()
                
               
                
            case.failure(let error):
                print(error)
                
                break
            }
        }
    }
    
    
    func mapCellData(){
        self.cellDataSource.value=self.dataSource?.results ?? []
    }
    
}
