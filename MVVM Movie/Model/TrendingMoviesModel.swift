//
//  TrendingMoviesModel.swift
//  MVVM Movie
//
//  Created by Nasser Mohamed on 14/05/2023.
//

import Foundation
// MARK: - CategoryProduct
// MARK: - CategoryProduct
struct TrendingMovieModel: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Movie: Codable {
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let title: String
    let original_language: String
    let original_title, overview, poster_path: String
    let media_type:String
    let genre_ids: [Int]
    let popularity: Double
    let release_date: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int

   
}

enum MediaType: String, Codable {
    case movie = "movie"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case no = "no"
}
