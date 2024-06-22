//
//  MovieDetailViewModel.swift
//  MovieBook
//
//  Created by Sevde Aydın on 22.09.2023.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetail : MovieeDetailViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetail(imdbId: String) {
        downloaderClient.downloadMovieDetail(imdbId: imdbId) { (result) in
            switch result {
            case .failure(let hata):
                print(hata)
                
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = MovieeDetailViewModel(detail: movieDetail)
                }
            }
        }
    }
     
    
}


struct MovieeDetailViewModel {
    
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    
    var poster : String {
        detail.poster
    }
    
    var year : String {
        detail.year
    }
    
    var imdbId : String {
        detail.imdbId
    }
    
    var director : String {
        detail.director
    }
    
    var writer : String {
        detail.writer
    }
    
    var awards : String {
        detail.awards
    }
    
    var plot : String {
        detail.plot
    }
    
    var imdbRating : String {
        detail.imdbRating
    }
    
    var actors : String {
        detail.actors
    }
}
