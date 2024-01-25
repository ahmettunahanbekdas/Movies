//
//  HomeScreen.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 22.01.2024.
//

import UIKit

protocol HomeScreenInterface: AnyObject {
    func configureVC()
    func configureCollectionVC()
}

//MARK: - class HomeScreen
final class HomeScreen: UIViewController {
    
    private let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        configureCollectionVC()
        viewModel.viewDidLoad()
    }
}

//MARK: - extension HomeScreen
extension HomeScreen: HomeScreenInterface {
    //MARK: - configureVC
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    //MARK: - configureCollectionVC()
    func configureCollectionVC() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.CreateHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.pinToEdgesOf(view: view)
        collectionView.translatesAutoresizingMaskIntoConstraints = false // Önemli

        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
    }
}
    //MARK: - UICollectionViewDelegate and UICollectionViewDataSource
extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource { //Bunlarda bir protokol içersinde ki metodalara ulaşıyoruz
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as? MovieCell else { return UICollectionViewCell()}
        return cell
    }
}












// collectionView.pinToEdgesOf(view: view) ---->

//   NSLayoutConstraint.activate([ // Tüm ekranı kaplayacak şekilde constraintleri verildi
//       collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//       collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//       collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//       collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//   ])
