//
//  HomeScreen.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 22.01.2024.
//



import UIKit

protocol HomeScreenInterface: AnyObject {
    func configureVC()
}

final class HomeScreen: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        
        viewModel.viewDidLoad()
    }
}

extension HomeScreen: HomeScreenInterface {
    
    func configureVC() {
        view.backgroundColor = .systemPink
    }
}
