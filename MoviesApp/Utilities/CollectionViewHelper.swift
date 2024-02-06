//
//  UIHelper.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 24.01.2024.
//

import UIKit

enum CollectionViewHelper {
    static func CreateHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let dWith = CGFloat.dWith

        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: dWith, height: dWith * 1.5)
        layout.minimumLineSpacing = 30
        
        return layout
    }
}

