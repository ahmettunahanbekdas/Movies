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
        
       dataTask = NetworkManager.shared.download(url: url) { [weak self] result in
           guard let self = self else { return }
           switch result {
           case .success(let data): //Değişken tanımlar let kullanmak zorunda değiliz örnek olarak arrays üzerinde işlem yapabilmek için var olarak tanımlamalıyız
               DispatchQueue.main.async {
                   self.image = UIImage(data: data)
               }
           case .failure(let error):
               DispatchQueue.main.async {
                   print(error.localizedDescription)
               }
           }
        }
        dataTask?.resume()
    }
    
    func cancelDownload() {
        dataTask?.cancel()
        dataTask = nil
    }
}
