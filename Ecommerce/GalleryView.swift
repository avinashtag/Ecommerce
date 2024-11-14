//
//  GalleryView.swift
//  Ecommerce
//
//  Created by Avinash on 14/11/2024.
//

import SwiftUI
import PhotosUI

struct GalleryView: View {
    
    @State var photosPickerItem : PhotosPickerItem?
    @State var image : Image?
    
    var body: some View {
        if let image{
            image
                .resizable()
                .frame(width: 200, height: 200)
        }
        PhotosPicker(selection: $photosPickerItem) {
            Label("Choose your picture", systemImage: "Image")
        }
        .onChange(of: photosPickerItem) {
            photosPickerItem?.loadTransferable(type: Image.self, completionHandler: { result in
                switch result {
                case .success(let success):
                    image = success
                case .failure(let failure):
                    break
                }
            })
        }
        
    }
}

#Preview {
    GalleryView()
}
