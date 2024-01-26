//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Ahmet Tunahan Bekdaş on 22.01.2024.
//

// Bütün istekleri bu oluşturduğumuz Class üzerinden atacağız. Sürekli URLSession oluşturmayacağız
// Singleton bir yapı oluşturuyoruz
// 1- Initialize ediyoruz
// 2- Eğer bu şekilde yapmazsak istediğimiz kadar initalizier edebiliriz ki bu durum Singleton yapısına uymaz
// 2- Bu sayede sadece class içersinde initalizier edebiliriz ki istediğimiz bu
// 3- Fonksiyonumuzu oluşturduk ve bir URL verdik ve bize data response ve error döndürdücek
// 4- Sırayla kontrolleri sağlıyoruz error var ise işlemler iptal edilir.
// 4- Sonrasında response bakacağız biz get isteği attık ve server bize ne gönderdi yanıt olarak
// 4- En son olarak ise dönen datayı çevirmeye çalışacağız
// 5- if let ile error değerimizi optional olmaktan kurtardık yani kontrol ettik içinin dolu olup olmamasını
// 6- Error olduğu için completion bloğundan çıkış yaptık
// 7- Gelen response kodu benim için geçerli mi bunu kontrol edeceğiz
// 7- Geçerli olan kod hhtp 200 kodudur -> Sucsses demektir yani başrılı
// 7- Dönen responsu HTTPURLResponse a cast ettik eğer başarılıysa ve responun status kodu 200 e eşir ise decam et
// 8- Biz dönen datayı services kısmında kullanacağız modelimize göre değiştireceğiz
// 8- Datayı @escaping closure kullanarak göndereceğiz
// 9- Burada @escaping clousure kullandık bu şekilde fonksiyonun çalışmasını beklemeden ankekron olarak çalışmasını sağlar
// 9- Örnek verececek olursa instagram uygulamasında bir resim açmaya çalışınca resim yüklenmese bile bizi o sayfaya yönlendiri
// 9- Resim yüklenene kadar o sayfayı açmamazlık yapmaz
// 9- Ve bize bize başarılı veya başarısız durumda bir döndürme işlemi yapacaktır
// 9- İlk kısıma istediğimiz tipte giriş yapabiliriz fakart ikinci kısımda error conform etmesi gerekiyor
//10- Bu kısımda failure döndürücek ve error çalışıcak
//11- Burada da failure dödürdük fakat biz yukarıda ki erroru döndüremedik çünkü sadece yukarıda ki blok aralığında unwrap ettik
//11- Biz ise burada eğer ki statuscode 200 ise okey fakat değil ise iyi değil dedik
//11- badServerResponse errora conform etmek zorundadır ve bu bir custom errordur
//12- data nil kontrolü
//13- datayı sucsses e yolladık 


import Foundation

class NetworkManager {
    static let shared = NetworkManager() //1
    private init() {} //2

    func download(url: URL, completion:@escaping (Result<Data,Error>) -> ()) { //3 //9
         URLSession.shared.dataTask(with: url) { data, response, error in //4
            if let error = error { //5
                print(error.localizedDescription)
                completion(.failure(error)) //10
                return //6
            }
            guard //7
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))//11
                return
            }
            
            guard //8
                let data = data else {
                completion(.failure(URLError(.badURL)))//12
                return }
            completion(.success(data))
            
        } .resume()
        
    }
}









