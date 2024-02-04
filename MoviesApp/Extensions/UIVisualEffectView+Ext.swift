//
//  UIBlurEffect+Ext.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 4.02.2024.
//

import UIKit

extension UIVisualEffectView {
    func pinToEdgesEffect(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            widthAnchor.constraint(equalToConstant: CGFloat.dWith/2),
            heightAnchor.constraint(equalToConstant: CGFloat.dHeight/12)
        ])
    }
}
