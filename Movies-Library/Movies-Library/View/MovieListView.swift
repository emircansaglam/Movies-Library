//
//  ContentView.swift
//  Movies-Library
//
//  Created by Emircan saglam on 9.03.2022.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var filmListeViewModel : MoviesListViewModel
    
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = MoviesListViewModel()
        
    }
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                
                TextField("Aranacak Film", text: $aranacakFilm) {
                    
                    self.filmListeViewModel.FilmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                }.textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                
                List(filmListeViewModel.filmler, id: \.imdbId) { film in
                    
                    NavigationLink {
                        DetailView(imdbId: film.imdbId)
                    } label: {
                        HStack{
                            SpecialImageView(url: film.poster)
                                .frame(width: 100, height: 150)
                            VStack(alignment: .leading){
                                Text(film.title)
                                    .font(.title3)
                                Text(film.year)
                                    .foregroundColor(.red)
                            }
                        }
                    }

                    
                    
                }.navigationTitle(Text("Film Kitabı"))
            }
                
            }
            
            
            
           
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
