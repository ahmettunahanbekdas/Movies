//
//  UILabel+Ext.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 4.02.2024.
//

import UIKit

extension UILabel {
    func pinTitleHomePage(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dWith / 26)
        ])
    }
}
