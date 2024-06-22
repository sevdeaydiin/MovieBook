//
//  ContentView.swift
//  MovieBook
//
//  Created by Sevde Aydın on 21.09.2023.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    @State var searchMovie = ""
    
    init(){
        self.movieListViewModel = MovieListViewModel()
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Movie", text: $searchMovie, onEditingChanged:{ _ in },onCommit: {
                    self.movieListViewModel.movieSearch(movieName: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                }).padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(movieListViewModel.movies, id: \.imdbId) { movie in
                    
                    NavigationLink(destination: DetailView(imdbId: movie.imdbId), label: {
                        HStack {
                            SpecialImage(url: movie.poster)
                                .frame(width: 100, height: 120)
                            
                            VStack (alignment: .leading) {
                                Text(movie.title)
                                    .font(.title3)
                                
                                Text(movie.year)
                                    .foregroundColor(.orange)
                            }
                        }
                        
                    })
                    
                }.navigationTitle(Text("Movies"))
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
