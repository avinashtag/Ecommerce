//
//  CartagorryView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 21/09/24.
//

import SwiftUI

struct CategorieView: View {
    var imagesSet =
    [
        "Electronics",
        "Fashon",
        "Grosiris",
        "HomeApplincies",
        "KidsNeed"
    ]
    var names=[
        "Electronics",
        "Fashon",
        "Grosiris",
        "HomeApplincies",
        "KidsNeed"
    ]
    
    var body: some View {
        VStack
        {
            Image("FashonSale")
                .resizable()
                .scaledToFit()
                .frame(width: 500,height: 200)
        }
        Divider()
        Text("Categories")
            .font(.title2)
            .bold()
        
        ScrollView(.horizontal) {
            HStack {
                
                // Zip the images and names to create pairs of (image, name)
                ForEach(Array(zip(imagesSet, names)), id: \.0) { image, name in
                    VStack {
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text(name)
                            .font(.subheadline)
                            .bold()
                        
                    }
                    .padding()
                }
            }
            
        }.background(.pink)
    }
}

#Preview {
    CategorieView()
}
