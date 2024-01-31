//
//  HomeScreen.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 22.01.2024.
//

import UIKit

//MARK: - protocol HomeScreenInterface
// HomeScreen sınıfının uygulayacağı protokol. Bu protokol, belirli davranışları sağlamak üzere tanımlanmış metotları içerir.
protocol HomeScreenInterface: AnyObject {
    func configureVC()
    func configureCollectionVC()
}

//MARK: - class HomeScreen
// HomeScreen sınıfı, UIViewController sınıfından türetilmiştir.
class HomeScreen: UIViewController {
    // HomeViewModel sınıfından bir örnek oluşturulur.
    private let viewModel = HomeViewModel()
    // UICollectionView nesnesini saklamak için bir özellik.
    private var collectionView: UICollectionView!
    
    // UIViewController'ın yaşam döngüsü olaylarından biri olan viewDidLoad, viewController yüklendiğinde çağrılır.
    override func viewDidLoad() {
        super.viewDidLoad()
        // ViewModel'in view özelliği, HomeScreen'e atanır.
        viewModel.view = self
        // CollectionView'un yapılandırılması ve ViewModel'in viewDidLoad fonksiyonunun çağrılması.
        configureCollectionVC()
        viewModel.viewDidLoad()
    }
}

//MARK: - extension HomeScreen
// HomeScreen sınıfına ek özellikler eklemek için kullanılan bir extension. HomeScreenInterface protokolünü uygular.
extension HomeScreen: HomeScreenInterface {
    //MARK: - configureVC
    // UIViewController'ın görünümünün yapılandırılması için kullanılır.
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    //MARK: - configureCollectionVC()
    // UICollectionView'nun yapılandırılması için kullanılır.
    func configureCollectionVC() {
        // UICollectionView örneği oluşturulur ve görünüme eklenir.
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.CreateHomeFlowLayout())
        view.addSubview(collectionView)
        collectionView.pinToEdgesOf(view: view)
        collectionView.translatesAutoresizingMaskIntoConstraints = false // Önemli

        // UICollectionView'nun veri kaynağı ve delegesi olarak HomeScreen sınıfı atanır.
        collectionView.dataSource = self
        collectionView.delegate = self

        // MovieCell sınıfının kullanılacağı belirtilir.
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
    }
}

//MARK: - UICollectionViewDelegate and UICollectionViewDataSource
// UICollectionView'nun delegesi ve veri kaynağı için kullanılan bir extension.
extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    // UICollectionViewDelegate metotları implemente edilir.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Film sayısı
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Belirli bir hücreyi oluşturan ve döndüren metot
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        // Hücrenin içeriği ayarlanır
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
    }
}
