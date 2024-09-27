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
    @State private var product : Products.Product?

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
                    
                    ProductBannerView(product: $product)
//                    CategorieView()
                    Divider()
                    
//                    ProductBannerView(product: Binding(get: {
//                        products.first
//                    }, set: { _ in
//                        
//                    }))
                  
                    ProductCollectionView(title: $productsForYou, products: $products)
                   
                    Divider()
                    Spacer()
                })
                
            }
            
        }
        .task {
            
            do{
                products = try await Products.Request().load()
                guard products.count > 0 else { return }
                product = products.first(where: {$0.title == "Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5"})
                //Hint to search
                products.filter({$0.category == .electronics})
                products.filter({$0.title == ""})
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

/*
 
 Search bar working
 -Search in products and show in list
 - filter suppose to work
 - detail page
 - logout
 - add tabbar
 
 */

