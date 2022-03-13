//
//  ImageDownloaderClient.swift
//  Movies-Library
//
//  Created by Emircan saglam on 12.03.2022.
//

import Foundation

class ImageDownloaderClient : ObservableObject {
    
    @Published var IndirilenGorsel : Data?
    
    func imageDownloader(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data,response , error in
            
            guard let data = data , error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.IndirilenGorsel = data
            }
            
        }.resume()
        
    }
    
}
