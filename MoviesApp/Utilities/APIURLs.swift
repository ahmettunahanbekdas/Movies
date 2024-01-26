//
//  APIURLs.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 23.01.2024.
//

import Foundation

enum APIURLs {
    static func movie(page: Int) -> String {
        return "https://api.themoviedb.org/3/movie/popular?api_key=e0c4d4f140763a5ced128836116cff61&language=en-US&page=\(page)"
    }
    
    static func images(posterPath: String) -> String {
        return "https://image.tmdb.org/t/p/w500/\(posterPath)"
    }
}
