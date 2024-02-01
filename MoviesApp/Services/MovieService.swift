//
//  MovieServices.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 23.01.2024.
//

import Foundation

final class MovieService {
    // API'den filmleri indirmek için kullanılan fonksiyon
    func downloadMovies(page: Int, completion: @escaping([MovieResult]?) -> ()) {
        // APIURLs.movie fonksiyonu ile bir URL oluşturulur
        guard let url = URL(string: APIURLs.movie(page: page)) else {
            return print("APIurl Error")
        }
        // NetworkManager üzerinden asenkron bir ağ isteği yapılır
        NetworkManager.shared.download(url: url) { [weak self] result in
            // Güçlü referans döngüsünü önlemek için [weak self] kullanılır
            guard let self = self else { return }
            // NetworkManager'dan gelen sonucu değerlendirir
            switch result {
            case .success(let data):
                // Başarılı durumda, gelen veriyi işleyerek completion handler'a iletilir
                completion(self.handleWithData(data))
            case .failure(let error):
                // Hata durumunda, hatayı işleyen fonksiyon çağrılır
                self.handleWithError(error)
            }
        }
    }
    // Hata durumunu işleyen özel fonksiyon
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    // Başarılı durumda veriyi işleyen özel fonksiyon
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            // Veriyi Movie tipine çözerek film sonuçlarını alır
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch let error {
            // JSON çözme hatası durumunda hata yazdırılır ve nil döndürülür
            print(error)
            return nil
        }
    }
}

