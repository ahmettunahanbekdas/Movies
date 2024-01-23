//
//  SceneDelegate.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 22.01.2024.
//
/*
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }
}


*/
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // UIWindow nesnesi, kullanıcı arayüzünün temel taşıdır ve ekranda görünen içeriği yönetir.
    var window: UIWindow?

    // Kullanıcı arayüzü sahnesi oluşturulduğunda bu metod çalışır.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Sağlanan sahne bir UIWindowScene'e dönüştürülebilirse devam et, aksi halde çık.
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Yeni bir pencere (window) oluştur ve boyutunu sahnenin sınırları içinde ayarla.
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)

        // Pencerenin sahnesini belirle.
        window?.windowScene = windowScene

        // Pencerenin ana görünüm denetleyicisini (ViewController) belirle.
        window?.rootViewController = HomeScreen()

        // Pencereyi görünür hale getir.
        window?.makeKeyAndVisible()
    }
}


