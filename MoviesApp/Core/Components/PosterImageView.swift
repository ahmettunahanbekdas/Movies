//
//  PosterImageView.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 25.01.2024.
//

import UIKit

class PosterImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
