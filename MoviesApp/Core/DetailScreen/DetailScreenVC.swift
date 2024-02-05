//
//  DetailScreen.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 2.02.2024.
//

import UIKit

protocol DetailScreenInterface: AnyObject {
    func configureVC()
    func configurePosterImageView()
    func downloadPosterImageView()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverviewLabel()
}

final class DetailScreen: UIViewController{
    private var posterImageView: PosterImageView!
    private let viewModel = DetailViewModel() //Bağlantı
    private let movie: MovieResult
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UILabel!
    private var padding:CGFloat = 16
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        print("Detail Screen Init")
        
    }
    
    deinit {
        print("Detail Screen Deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self //Bağlantı
        viewModel.viewDidLoad()
    }
}

extension DetailScreen: DetailScreenInterface {
    func configureTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = movie._title
        titleLabel.font = UIFont(name: "Impact", size: 30)
        titleLabel.numberOfLines = 2
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
    
    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = movie._releaseDate
        dateLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0)
        ])
    }
    
    func configureOverviewLabel() {
        overviewLabel = UILabel(frame: .zero)
        view.addSubview(overviewLabel)
        overviewLabel.text = movie._overview
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding),
            overviewLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: 0),
            overviewLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
    }
    
   func configureVC() {
       view.backgroundColor = .systemBackground
   }
    
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.downloadImage(movie: movie)
        
        NSLayoutConstraint.activate([
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat.dWith / 14),
            posterImageView.widthAnchor.constraint(equalToConstant: CGFloat.dWith/2),
            posterImageView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight/3)
        ])
        posterImageView.layer.cornerRadius = 30
        posterImageView.clipsToBounds = true
        posterImageView.backgroundColor = .systemGray
    }
    
    func downloadPosterImageView() {
        posterImageView.downloadImage(movie: movie)
        
    }
    
}
