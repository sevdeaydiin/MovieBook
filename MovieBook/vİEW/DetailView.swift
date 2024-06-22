//
//  DetailView.swift
//  MovieBook
//
//  Created by Sevde Aydın on 22.09.2023.
//

import SwiftUI

struct DetailView: View {
    
    var imdbId : String
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        
        ScrollView {
            VStack (alignment: .leading, spacing: 1) {
                HStack {
                    Spacer()
                    SpecialImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
                    
                        .shadow(radius: 15)
                    Spacer()
                }
                
                Text(movieDetailViewModel.movieDetail?.title ?? "Film ismi gösterilecek")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.04)
                
                HStack {
                    Spacer()
                    Text(movieDetailViewModel.movieDetail?.year ?? "Yıl")
                        .padding()
                        .font(.title2)
                    Spacer()
                    Text("IMDB Rating: \(movieDetailViewModel.movieDetail?.imdbRating ?? "Rating")")
                        .padding()
                        .font(.title2)
                    Spacer()
                }
                
                
                Text(movieDetailViewModel.movieDetail?.plot ?? "plot").padding()
                
                Text("Actors: \(movieDetailViewModel.movieDetail?.actors ?? "Ödüller")").padding()
                
                Text("Director: \(movieDetailViewModel.movieDetail?.director ?? "Yönetmen")").padding()
                
                //Text("Writer: \(movieDetailViewModel.movieDetail?.writer ?? "Yazar")").padding()
                
                Text("Awards: \(movieDetailViewModel.movieDetail?.awards ?? "Ödüller")").padding()
                
                
                
                
                
                Spacer()
            }.onAppear(perform: {
                self.movieDetailViewModel.getMovieDetail(imdbId: imdbId)
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "tt0120338")
    }
}
