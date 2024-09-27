//
//  ProductBannerView.swift
//  Ecommerce
//
//  Created by Avinash on 24/09/2024.
//

import SwiftUI

struct ProductBannerView: View {
    
    @State var forYouProductTitle: String = "For you"
    @State private var products : [Products.Product] = []
    
    
    var body: some View {
        VStack
        {
            Text("For You")
                .font(.title2)
                .bold()
            Image("FashonSale")
                .resizable()
                .scaledToFit()
//                .frame(width: 350,height: 250)
                .frame(width: UIScreen.main.bounds.width-30,height: 30)
            
           
            
            ProductCollectionView(title: $forYouProductTitle,products: $products)
        }
        
        //Frame suppose to be by uiscreen bound relative
        //Height make it 16:9 ratio
        
        .task {
            
            do{
                products = try await Products.Request().load()
            }
            catch{
                print(error)
            }
        }
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
    ProductBannerView()
}
