//
//  DownloaderClient.swift
//  MovieBook
//
//  Created by Sevde Aydın on 21.09.2023.
//

import Foundation
class DownloaderClient {
    
    //filmleri indir
    func downloadMovie(search: String, completion: @escaping (Result<[Movie], DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=b06adebc") else {
            return completion(.failure(.yanlisuRL))
        }
        
        URLSession.shared.dataTask(with: url)  { data, response, error in
            guard let data = data, error==nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GetMovie.self, from: data)
            else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(filmCevabi.movies))
            
        }.resume()
    }
    
    func downloadMovieDetail(imdbId: String, completion: @escaping (Result<MovieDetail,
                                                                    DownloaderError>) -> Void){
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=b06adebc") else {
            return completion(.failure(.yanlisuRL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            guard let gelenFilmDetayi = try? JSONDecoder().decode(MovieDetail.self,
                                                                  from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(gelenFilmDetayi))
        }.resume()
    }
    
}

enum DownloaderError: Error {
    case yanlisuRL
    case veriGelmedi
    case veriIslenemedi
}
