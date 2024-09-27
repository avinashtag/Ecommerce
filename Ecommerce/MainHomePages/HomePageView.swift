//
//  HomePageView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 20/09/24.
//

import SwiftUI

struct HomePageView: View {
    
    

//    @State var forYouProductTitle: String = "For you"
    @State var productsForYou: String = "Products For You"
    
    @State private var products : [Products.Product] = []
    
    var body: some View {
//        SearchView(search: "")
        ZStack
        {
            LinearGradient(gradient: Gradient(colors: [.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomLeading)
                .ignoresSafeArea(.all)
            
            ScrollView
            {
                VStack( content: {
                    SearchView(search: "")
                    Divider()
                    HStack{
                        Spacer()
                        
                        Spacer()
                    }
//                    ProductBannerView()
//                    CategorieView()
                    Divider()
                  
                    ProductCollectionView(title: $productsForYou, products: $products)
                   
                    Divider()
                    Spacer()
                })
                
            }
            
        }
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

#Preview {
    HomePageView()
}



