//
//  MovieViewModel.swift
//  MovieBook
//
//  Created by Sevde Aydın on 22.09.2023.
//

import Foundation

class MovieListViewModel : ObservableObject { //gözlemlenebilir
    
    //gözlemlenen değişken
    @Published var movies = [MovieViewModel]()
    let downloaderClient = DownloaderClient()
    
    //film araması yap
    func movieSearch(movieName: String){
        downloaderClient.downloadMovie(search: movieName) { (sonuc) in
            switch sonuc {
                case.failure(let hata):
                    print(hata)
                case.success(let filmDizisi):
                DispatchQueue.main.async {
                    self.movies = filmDizisi.map(MovieViewModel.init)
                }
                
            }
        }
    }
}


struct MovieViewModel {
    
    let movie : Movie
    
    //kullanıcıya göstereceğimiz değerleri alıyoruz
    var title : String {
        movie.title
    }
    
    var poster : String {
        movie.poster
    }
    
    var year : String {
        movie.year
    }
    
    var imdbId : String {
        movie.imdbId
    }
}
