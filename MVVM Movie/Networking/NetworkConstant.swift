//
//  NetworkConstant.swift
//  MVVM Movie
//
//  Created by Nasser Mohamed on 14/05/2023.
//

import Foundation
//static let apiKey="d34d5ae176707ff2d42e9432ea54059f"
//   static let baseUrl="https://api.themoviedb.org"

class NetworkConstant{
    public static var shared:NetworkConstant=NetworkConstant()
    private init(){
        
    }
    public var apiKey:String{
        get{
            return "d34d5ae176707ff2d42e9432ea54059f"
        }
    }
    
    
    public var serverAddress:String{
        get{
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress:String{
        get{
            return "https://api.themoviedb.org/3/movie/"
        
        }
    }
    
    
}
