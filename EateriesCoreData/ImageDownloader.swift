//
//  ImageDownloader.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 14/5/21.
//

import SwiftUI

func imageDownload (_ input: String) -> Image {
    
    guard let imageURL = URL(string: input) else {
        print ("Invalid URL")
        return (Image("Placeholder"))
    }
    
    guard let imageData = try? Data(contentsOf: imageURL) else {
        print ("Cannot convert URL to Data")
        return (Image("Placeholder"))
    }
    
    guard let uiImage = UIImage(data: imageData) else {
        print ("Cannot convert Data into an image")
        return (Image("Placeholder"))
    }
    
    let downloadedImage = Image(uiImage: uiImage)
    return downloadedImage
}
