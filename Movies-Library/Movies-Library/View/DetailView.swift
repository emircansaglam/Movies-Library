//
//  DetailView.swift
//  Movies-Library
//
//  Created by Emircan saglam on 13.03.2022.
//

import SwiftUI





struct DetailView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = MoviesDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            SpecialImageView(url: filmDetayViewModel.filmDetay?.poster ?? "")
    
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3)
                .position(x: UIScreen.main.bounds.width * 0.5,y: UIScreen.main.bounds.height * 0.2 )
                
                
                
            
            Text(filmDetayViewModel.filmDetay?.title ?? "title")
                .foregroundColor(.blue)
                .padding()
            
            Text("Yönetmen : \(filmDetayViewModel.filmDetay?.director ?? "")")
                
                .padding()
            Text("Ödüller : \(filmDetayViewModel.filmDetay?.awards ?? "")")
                
                .padding()
            Text("Özet : \(filmDetayViewModel.filmDetay?.plot ?? "")")
                
                .padding()
            
        }.onAppear {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "Test")
    }
}
