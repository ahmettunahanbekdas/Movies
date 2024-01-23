//
//  MovieServices.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 23.01.2024.
//

import Foundation

class MovieServices {
    
    func downloadMovie(completion: @escaping ([MovieResult]?) -> ()){
        guard let url = URL(string: APIURLs.movie(page: 1)) else { return }
        
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
    private func handleWithError(_ error: Error){
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [MovieResult]?{
        do{
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.result
        }catch let error{
            print(error)
            return nil
        }
    }
    
}
