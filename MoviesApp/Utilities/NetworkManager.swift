//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 22.01.2024.
//

import Foundation

final class NetworkManager {
    // Singleton deseni: NetworkManager sınıfının tek bir örneği paylaşılır.
    static let shared = NetworkManager()
    // Singleton deseni: Sınıfın dışından yeni örneklerin oluşturulmasını engelleyen private init metodu.
    private init() {}
    // Verilen URL'den veri indiren bir fonksiyon.
    func download(url: URL, completion: @escaping(Result<Data,Error>) -> ()) {
        // URLSession.shared.dataTask, belirtilen URL'den veri indirme işlemini başlatır.
        URLSession.shared.dataTask(with: url) { data, response, error in //4
            // Hata kontrolü: Eğer bir hata varsa, hatayı yazdır ve completion handler'ı çağırarak hata durumunu bildir.
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            // HTTP yanıt kontrolü: Yanıtın bir HTTP yanıtı olup olmadığını ve durum kodunun 200 (OK) olup olmadığını kontrol eder.
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                // Durum kodu 200 değilse, bir hata durumu bildirilir.
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            // Veri kontrolü: İndirilen verinin varlığını kontrol eder.
            guard
                let data = data else {
                // Veri yoksa, bir hata durumu bildirilir.
                completion(.failure(URLError(.badURL)))
                return
            }
            // Başarılı durumda, completion handler'ı çağırarak indirilen veriyi bildirir.
            completion(.success(data))
        } .resume() // URLSession.dataTask fonksiyonu başlatılır.
    }
}










