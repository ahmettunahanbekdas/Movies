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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cofigureMovieCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        print("Reusable called cell!!")
        posterImageView.image = nil
        posterImageView.cancelDownload()
    }
    
    func setCell(movie: MovieResult) {
        posterImageView.downloadImage(movie: movie)
        
    }
    
    private func cofigureMovieCell() {
        backgroundColor = .systemGray6
        layer.cornerRadius = CGFloat.dWith/10
        clipsToBounds = true
    }
    
    private func configurePosterImageView(){
        posterImageView = PosterImageView(frame:.zero)
        addSubview(posterImageView)
        
        posterImageView.pinToEdgesOf(view: self)
        
    }
}
