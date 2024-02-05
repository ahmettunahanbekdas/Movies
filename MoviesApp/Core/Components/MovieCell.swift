//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 24.01.2024.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    static let reuseID = "MovieCell"
    
    private var  posterImageView: PosterImageView!
    private var movie: MovieResult!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMovieCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        posterImageView.image = nil
        posterImageView.cancelDownload()
    }
    
    func setCell(movie: MovieResult) {
        self.movie = movie
        posterImageView.downloadImage(movie: movie)
    }
    
    private func configureMovieCell() {
        backgroundColor = .systemGray6
        layer.cornerRadius = CGFloat.dWith/10
        clipsToBounds = true
    }
    
    private func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
        posterImageView.pinToEdgesOf(view: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Ana ekranda başlıları ekleme işlemi -
    /*
     private func configureCellTitle() {
     let blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
     let blurEffectView = UIVisualEffectView(effect: blurEffect)
     addSubview(blurEffectView)
     blurEffectView.pinToEdgesEffect(view: posterImageView)
     
     addSubview(cellTitle)
     cellTitle.pinTitleHomePage(view: posterImageView)
     cellTitle.textColor = .white
     cellTitle.font = UIFont.systemFont(ofSize: 28, weight: .bold)
     }
     */
}
