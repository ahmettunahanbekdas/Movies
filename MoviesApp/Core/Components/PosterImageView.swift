//
//  PosterImageView.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 25.01.2024.
//

import UIKit

final class PosterImageView: UIImageView {
    
   private var dataTask: URLSessionDataTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Burada resimleri indireceğiz buradan MovieCell de set edeceğiz
    func downloadImage(movie: MovieResult){
        guard let url = URL(string: APIURLs.images(posterPath: movie._posterPath)) else {return}
        
       dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
       }
        dataTask?.resume()
    }
    
    func cancelDownload() {
        dataTask?.cancel()
        dataTask = nil
    }
}
