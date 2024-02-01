//
//  UIHelper.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 24.01.2024.
//

import UIKit

// UIHelper adında bir enum tanımlanmış.
enum UIHelper {
    // CreateHomeFlowLayout adında bir static fonksiyon tanımlanmış.
    static func CreateHomeFlowLayout() -> UICollectionViewFlowLayout {
        // UICollectionViewFlowLayout sınıfından bir örnek oluşturuluyor.
        let layout = UICollectionViewFlowLayout()
        // Ekran genişliği bilgisini CGFloat extension ile alıyoruz.
        let dWith = CGFloat.dWith
        // Layout'un yatay kaydırma yönlü olacağını belirtiyoruz.
        layout.scrollDirection = .vertical
        // Her bir hücrenin boyutunu ve genişliğini belirliyoruz.
        layout.itemSize = CGSize(width: dWith, height: dWith * 1.5)
        // Hücreler arasındaki minimum satır aralığını belirliyoruz.
        layout.minimumLineSpacing = 30
        // Bölme içindeki içerik ile bölme arasındaki kenar boşluklarını belirliyoruz.
        // layout.sectionInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 100) // !!!!!!! Saçma bir hata geliyor karşıma anlayamdım 
        
        // Oluşturulan layout'u geri döndürüyoruz.
        return layout
    }
}

