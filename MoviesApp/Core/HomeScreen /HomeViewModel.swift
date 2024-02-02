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
    private var page = 1
    //  var shouldDownload = true
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionVC()
        getMovies()
    }
    
    func getMovies() {
        // shouldDownload = false
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else {
                print("Weak self is nil")
                return
            }
            guard let returnedMovie = returnedMovies else {
                print("Returned movies is nil")
                return
            }
            self.movies.append(contentsOf: returnedMovie)
            print(self.page)
            self.page += 1
            self.view?.reloadData()
            //self.shouldDownload = true
        }
    }
    
    func getDetail(id: Int) {
        service.downloadDetail(id: id) { [weak self] returnedDetails in
            guard let self = self else {
                print("getDetailMovie Self Error")
                return
            }
            guard let returnedDetails = returnedDetails else {
                print("getDetailMovie Error")
                return
            }
            self.view?.navigatonToDetailScreen()
            print(returnedDetails)
        }
    }
}






