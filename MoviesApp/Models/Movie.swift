//
//  Movie.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 23.01.2024.
//

// Optional olarak tanımlıyorum çünkü jsondan nil gelebilir en azından proje patladan yürüsün

import Foundation

struct Movie: Decodable {
    let results: [MovieResult]?
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
    let overview: String?
    let releaseDate: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"  
        case title
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _title: String {
        title ?? ""
    }
    var _posterPath: String {
        posterPath ?? ""
    }
    var _overview: String {
        overview ?? "N/A"
    }
    var _releaseDate: String {
        releaseDate ?? "N/A"
    }
}
