//
//  ProductDetailView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 06/10/24.
//

import SwiftUI

struct ProductDetailView: View {
//    @Binding var category : Products.Category
//    var product:[Products]
//    @Binding var product: Products.Product?
    
    var body: some View {
        VStack
        {
//            AsyncImage(url: URL(string: product?.image ?? ""), scale: 1) { image in
//                image
//            }
            
            Image("iPad")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
//            Text(Progress.description())
            Text("Apple iPad (9th Gen)")
                .font(.title2)
                .bold()
            Text("₹ 21,000")
                .font(.title3)
                .bold()
                .foregroundStyle(Color.blue)
            Divider()
            Text("Details")
                .font(.title3)
                .underline()
                .bold()
            Text("64 GB ROM 25.91 cm (10.2 inch) \nDisplay 8 MP Primary Camera  12 MP \nFrontiOS 15 Battery: Lithium PolymerIdeal \nUsage: Entertainment, For Kids, Reading and BrowsingProcessor: \nA13 Bionic Chip with 64-bit Architecture")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
            Divider()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                   label: {
                Text("Buy Now")
                    .font(.title3)
                    .bold()
            }
                )
            .frame(width: 250,height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(30)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                   label: {
                Text("Add To Cart")
                    .font(.title3)
                    .bold()
            }
                )
            .frame(width: 250,height: 50)
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(30)
            
        }
    }
}

#Preview {
    ProductDetailView()
}
