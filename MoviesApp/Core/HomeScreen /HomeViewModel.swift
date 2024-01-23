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
}

final class HomeViewModel {
    weak var view: HomeScreenInterface?
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
    }
    
}
