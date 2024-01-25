//
//  UIHelper.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 24.01.2024.
//

import UIKit

enum UIHelper {
    static func CreateHomeFlowLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        
        let dWith = CGFloat.dWith //Oluşturduğum CGFloatExt ile genişliği aldık 
        
        layout.scrollDirection = .vertical //Scroll yönü
        layout.itemSize = CGSize(width: dWith, height: dWith * 1.5)
        layout.minimumLineSpacing = 30 //Aralarına boşluk verme
        
        return layout
    }
}
