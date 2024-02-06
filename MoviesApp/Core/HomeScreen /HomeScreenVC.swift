//
//  HomeScreen.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 22.01.2024.
//

import UIKit

//MARK: - protocol HomeScreenInterface -
protocol HomeScreenInterface: AnyObject {
    func navigatonToDetailScreen(movie: MovieResult)
    func configureVC()
    func configureCollectionVC()
    func reloadData()
}

// MARK: - class HomeScreen -
class HomeScreen: UIViewController {
    private let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

// MARK: - extensions HomeScreen: HomeScreenInterface -
extension HomeScreen: HomeScreenInterface {
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    func configureCollectionVC() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewHelper.CreateHomeFlowLayout())
        view.addSubview(collectionView)
        collectionView.pinToEdgesOf(view: view)
        collectionView.translatesAutoresizingMaskIntoConstraints = false // Önemli
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        
    }
    
    func navigatonToDetailScreen(movie: MovieResult) {
        DispatchQueue.main.async {
            let detailScreen = DetailScreen(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
    func reloadData() {
        collectionView.reloadCollectionView()
    }
}

// MARK: - HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource -
extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y //Scroll değerimiz
        let contentHeight = scrollView.contentSize.height //Tüm scroll uzunluğu
        let height = collectionView.frame.height // CollectionView uzunluğu
        
        guard  contentHeight != 0 else {return}
        if offSetY >= contentHeight - (2 * height) {
            viewModel.getMovies()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getDetail(id: viewModel.movies[indexPath.item]._id)
    }
}

//MARK: - scrollViewDidScroll
/*
 // Bu şekilde sadece scroll edip durunca func çalışıyor scrollViewDidScroll da ise 85 doldurduktan sonra en ufak  scroll kaydırmasında get çalıştırıyor (yukarıda ekstra koşul ile yaptığımız scrollViewDidScroll örneği de bulunmakta)
 
 func scrollViewDidScroll(_ scrollView: UIScrollView) {
 let offSetY = scrollView.contentOffset.y //Scroll değerimiz
 let contentHeight = scrollView.contentSize.height //Tüm scroll uzunluğu
 let height = collectionView.frame.height // CollectionView uzunluğu
 
 guard  contentHeight != 0 && viewModel.shouldDownload else {return} // ilk başta conten uzunluğu sıfır geldiği için koşul sağlanıyor ve 2 kere get edilmesini //önlemek için bu koşulu kullandık
 if offSetY >= contentHeight - (2 * height) {
 viewModel.getMovies()
 }
 }
 */
