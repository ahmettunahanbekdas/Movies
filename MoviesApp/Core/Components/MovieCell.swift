//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 24.01.2024.
//

import UIKit
//MARK: - class MovieCell
class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    
    private var posterImageView: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cofigureMovieCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configurePosterImageView()
    private func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        posterImageView.frame = CGRect(x: 30, y: 20, width: 200, height: 200)
        addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.pinToEdgesOf(view: self) //UIViewExt içersinde oluşturudğumuz extensionu kullanıyoruz referans olarakta MovieCell(self) veriyoruz
        posterImageView.backgroundColor = .red
    }
    
    //MARK: - cofigureMovieCell()
    private func cofigureMovieCell() {

        backgroundColor = .systemGray6
        layer.cornerRadius = CGFloat.dWith/7
        clipsToBounds = true //Taşan ImageViewleri atıyoruz
    }
    

}
