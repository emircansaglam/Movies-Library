//
//  MoviesViewModel.swift
//  Movies-Library
//
//  Created by Emircan saglam on 11.03.2022.
//

import Foundation
import SwiftUI


class MoviesListViewModel : ObservableObject{
    
    @Published var filmler = [MoviesViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func FilmAramasiYap(filmIsmi: String) {
        
        downloaderClient.filmleriIndir(search: filmIsmi) { sonuc in
            switch sonuc{
            case.failure(let hata):
                print(hata)
            case.success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi.map(MoviesViewModel.init)
                    }
                    
                }
            }
        }
        
    }
    
}

struct MoviesViewModel {
    
    let film : Film
    
    var title : String {
        film.title
    }
    
    var poster : String {
        film.poster
    }
    
    var year : String {
        film.year
    }
    
    var imdbId : String {
        film.imdbId
    }
}
