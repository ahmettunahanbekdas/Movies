//
//  MovieServices.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 23.01.2024.
//

import Foundation

final class MovieService {
    func downloadMovies(page: Int, completion: @escaping([MovieResult]?) -> ()) {
        guard let url = URL(string: APIURLs.movie(page: page)) else {
            return print("Movies APIurl Error")
        }
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func downloadDetail(id: Int, completion: @escaping (MovieResult?) -> ()) {
        guard let url = URL(string: APIURLs.details(id: id)) else {
            return print("MoviesDetail APIurl Error")
        }
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case.success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch let error {
            print(error)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> (MovieResult)? {
        do {
            let movieDetail = try JSONDecoder().decode(MovieResult.self, from: data)
            return movieDetail
        } catch let error {
            print(error)
            return nil
        }
    }
}

