//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 23.01.2024.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeScreenInterface? {get set}
    
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel {
    weak var view: HomeScreenInterface?  //Protokolde yazdığımızı extensionsta yazmama sebebimiz oraya yazılmaması
    private let service = MovieService() //Protokolün içersine tüm değişkenler yazılmaz çoğunukla fonksiyonaların tamamı olur
    var movies: [MovieResult] = [] //Bu array de filmleri toplayacağız
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionVC()
        getMovies()
    }
    
    func getMovies() {
        service.downloadMovies { [weak self] returnedMovies in
            guard let self = self else {
                print("Weak self is nil")
                return
            }

            guard let returnedMovie = returnedMovies else {
                print("Returned movies is nil")
                return
            }
            self.movies = returnedMovie
            print(returnedMovie)
        }
    }
}






