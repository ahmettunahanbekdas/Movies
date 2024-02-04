//
//  DetailViewModel.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 2.02.2024.
//

import Foundation

protocol DetailViewModelInterface {
    var view: DetailScreenInterface? { get set }//Bağlantı
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailScreenInterface? //Bağlantı
}

extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        view?.configureVC() //Bu işlemi yapmazsak kasıyor nedenini bilmiyorum
        view?.configurePosterImageView()
        view?.downloadPosterImageView()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
}
