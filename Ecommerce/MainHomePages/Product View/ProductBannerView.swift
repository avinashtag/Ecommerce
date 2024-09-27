//
//  ProductBannerView.swift
//  Ecommerce
//
//  Created by Avinash on 24/09/2024.
//

import SwiftUI

struct ProductBannerView: View {
    
    @State var forYouProductTitle: String = "For you"
    @Binding var product: Products.Product?
    
    
    var body: some View {
        VStack
        {
            Text("For You")
                .font(.title2)
                .bold()
            AsyncImage(url: URL(string: product?.image ?? ""), scale: 1) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(16/9, contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width-30)

            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            .frame(width: UIScreen.main.bounds.width-30)

        }
        
        //Frame suppose to be by uiscreen bound relative
        //Height make it 16:9 ratio
    }
}
/*
 
 Make it center image
 try pass first product and show image
 
 Create Product Detail page
 
 Optional
 - connect
 - show detail
 
 */
#Preview {
    ProductBannerView( product: Binding(get: { Products.Product(id: 0, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 20, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: .electronics, image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Products.Rating(rate: 4, count: 5)) }, set: { _ in }))
}
