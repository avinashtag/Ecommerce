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
    
    var likeSet =
    [
        "FossilWatch",
        "MenFootWare",
        "MenWare",
        "WomenWare"
    ]
    var likeSetNames =
    [
        "FossilWatch",
        "Sneakers",
        "Cargo",
        "Saree"
    ]
    
    var body: some View {
        VStack{
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
                            .clipShape(Circle())
                        
                        Text(name)
                            .font(.subheadline)
                            .bold()
                        
                    }
                }
                
            }
            
        }.background(.pink)
        Divider()
        
        VStack
        {
            Text("You May Like")
                .font(.title2)
                .bold()
        }
        
            ScrollView(.horizontal)
            {
                HStack
                {
                    ForEach(Array(zip(likeSet, likeSetNames)), id: \.0) { image, name in
                        VStack
                        {
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            Text(name)
                                .font(.subheadline)
                                .bold()
                        }
                    }
                }.padding()
            }.background(.green)
        Spacer()
    }
}

#Preview {
    CategorieView()
}
