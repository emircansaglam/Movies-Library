//
//  MoviesDetailViewModel.swift
//  Movies-Library
//
//  Created by Emircan saglam on 13.03.2022.
//

import Foundation
import SwiftUI

class MoviesDetailViewModel : ObservableObject {
    
    @Published var filmDetay : MoviesDetailModel?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId : String) {
        downloaderClient.filmDetayiniIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                    print(hata)
            case.success(let filmDetay):
                
                DispatchQueue.main.async {
                    self.filmDetay = MoviesDetailModel(detay: filmDetay)
                }
                
                
            }
        
        }
        
    }
    
    
    
}

struct MoviesDetailModel {
    
    let detay : FilmDetay
    
    var title : String {
        detay.title
    }
    
    var poster : String {
        detay.poster
    }
    
    var year : String {
        detay.year
    }
    
    var imdbId : String {
        detay.imdbId
    }
    
    var director : String {
        detay.director
    }
    
    var writer : String {
        detay.writer
    }
    
    var awards : String {
        detay.awards
    }
    
    var plot : String {
        detay.plot
    }
    
}
