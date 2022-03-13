//
//  SpecialImage.swift
//  Movies-Library
//
//  Created by Emircan saglam on 12.03.2022.
//

import SwiftUI

struct SpecialImageView: View {
    
    let url : String
    
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.imageDownloader(url: self.url)
    }
    
    
    var body: some View {
        if let data = self.imageDownloaderClient.IndirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image("placeholder")
                .resizable()
        }
    }
}

struct SpecialImage_Previews: PreviewProvider {
    static var previews: some View {
        SpecialImageView(url: "https://m.media-amazon.com/images/M/MV5BNzc5MTczNDQtNDFjNi00ZDU5LWFkNzItOTE1NzQzMzdhNzMxXkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_SX300.jpg")
    }
}
