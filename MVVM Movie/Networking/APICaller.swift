//
//  APICaller.swift
//  MVVM Movie
//
//  Created by Nasser Mohamed on 14/05/2023.
//

import Foundation

enum NetworkErrors:Error {
    case UrlError
    case canNotParseData
}
public class APICaller{
    
    static func getTrendingMovie(complitionHandler:@escaping(_ result:Result<TrendingMovieModel,NetworkErrors>)->Void){
        let urlString=NetworkConstant.shared.serverAddress + "trending/movie/day?api_key="+NetworkConstant.shared.apiKey
        guard let url = URL(string: urlString)else{
            complitionHandler(.failure(.UrlError))
            return
        }
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error  in
            
            if error==nil,
               let data=dataResponse,
               let resultdata=try? JSONDecoder().decode(TrendingMovieModel.self,from: data){
                complitionHandler(.success(resultdata))
            }else{
                complitionHandler(.failure(.canNotParseData))
            }
            
               
        }.resume()
    }
    
}
