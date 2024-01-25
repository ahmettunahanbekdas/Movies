//
//  MovieServices.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 23.01.2024.
//

import Foundation

//MARK: - final class MovieService
final class MovieService {
    //MARK: -  func downloadMovies()
    func downloadMovies(completion: @escaping ([MovieResult]?) -> ()){
        guard let url = URL(string: APIURLs.movie(page:1)) else { return print("1") }
        
        //MARK: - download
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else {return  print("1")}
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    //MARK: - func handleWithError()
    private func handleWithError(_ error: Error){
        print(error.localizedDescription)
    }
    //MARK: - func handleWithData()
    private func handleWithData(_ data: Data) -> [MovieResult]?{
        do{
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        }catch let error{
            print(error)
            
            return nil
        }
    }
    
}
