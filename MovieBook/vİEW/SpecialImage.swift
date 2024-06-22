//
//  SpecialImage.swift
//  MovieBook
//
//  Created by Sevde Aydın on 22.09.2023.
//

import SwiftUI

struct SpecialImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder").resizable()
        }
    }
}

struct SpecialImage_Previews: PreviewProvider {
    static var previews: some View {
        SpecialImage(url: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
    }
}
