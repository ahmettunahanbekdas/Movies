//
//  DetailScreen.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 2.02.2024.
//

import UIKit

protocol DetailScreenInterface: AnyObject {
   func configurePosterImageView()
    func test() 
}

final class DetailScreen: UIViewController{
    private var posterImageView: PosterImageView!
    private let viewModel = DetailViewModel() //Bağlantı
    private let movie: MovieResult
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self //Bağlantı
        view.backgroundColor = .systemBackground
        viewModel.viewDidLoad()
    }
}

extension DetailScreen: DetailScreenInterface {
    
    
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.downloadImage(movie: movie)

        NSLayoutConstraint.activate([
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat.dWith / 10), // Yukarıdan 50 birim boşluk
            posterImageView.widthAnchor.constraint(equalToConstant: CGFloat.dWith/2),
            posterImageView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight/3)
        ])
        posterImageView.layer.cornerRadius = CGFloat.dHeight / 8
        posterImageView.backgroundColor = .systemGray
    }
    func test() {
        print("PÜĞĞ")
    }
}
