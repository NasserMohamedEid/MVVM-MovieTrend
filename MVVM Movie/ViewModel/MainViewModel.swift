//
//  MainViewModel.swift
//  MVVM Movie
//
//  Created by Nasser Mohamed on 01/05/2023.
//

import Foundation
class MainViewModel{
    func numberOfSections()->Int{
    1
    }
    func numberOfRows(in section:Int)->Int{
        10
    }
    func getdata(){
        APICaller.getTrendingMovie { result in
            switch result{
            case.success(let data ):
                print(data.results.count)
                break
                
            case.failure(let error):
                print(error)
                
                break
            }
        }
    }
}
