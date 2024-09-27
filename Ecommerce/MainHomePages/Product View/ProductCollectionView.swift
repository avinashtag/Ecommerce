//
//  ProductCollectionView.swift
//  Ecommerce
//
//  Created by Avinash on 24/09/2024.
//

import SwiftUI



struct ProductCollectionView: View {
    
    @Binding var title: String
    @Binding var products: [Products.Product]

    
    var body: some View {
        VStack{
            Text(title)
                .font(.title2)
                .bold()
            ScrollView(.horizontal) {
                HStack {
                    
                    // Zip the images and names to create pairs of (image, name)
                    ForEach(products, id: \.self){ product in
                        VStack {
                            Text(product.title)
                                .font(.subheadline)
                                .bold()
                                .frame(width: 100)
                                .lineLimit(2)
                            
                            AsyncImage(url: URL(string: product.image), scale: 1) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100,alignment: .center)

                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }
                            .frame(width: 100, height: 100)

//                            Text(product.title)
//                                .font(.subheadline)
//                                .bold()
//                                .frame(width: 100)
//                                .lineLimit(2)
                            
                        }
                        .padding()
                    }
                }
                
            }
            .background(.pink)
            Spacer()
        }
        
    }
}


/*
 
 Aligment top
 Title = 2 lines
 
 
 */

//#Preview {
//    ProductCollectionView(title: <#Binding<String>#>, products: <#Binding<[Products.Product]>#>)
//}
