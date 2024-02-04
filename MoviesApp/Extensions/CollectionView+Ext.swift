//
//  CollectionView+Ext.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 31.01.2024.
//

import UIKit


extension UICollectionView {
    func reloadCollectionView(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
