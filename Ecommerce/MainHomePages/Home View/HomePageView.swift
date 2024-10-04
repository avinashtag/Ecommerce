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
    @State private var selectedCategory : [Products.Category] = []
    
    @State var isSelectedFilter: Bool = false

    var body: some View {
//        SearchView(search: "")
        ZStack
        {
            LinearGradient(gradient: Gradient(colors: [.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomLeading)
                .ignoresSafeArea(.all)
            
            ScrollView
            {
                VStack( content: {
                    SearchView(search: "", selectedCategory: $selectedCategory, isSelectedFilter: $isSelectedFilter, didFinishFilter: {
                        
                        //Filter your Products
//                       products =  products.filter({selectedCategory.contains($0.category)})
                    })
                    Divider()
                    
                    ProductBannerView(product: $product)
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
                guard products.count > 0 else { return }
                if isSelectedFilter{
                    products =  products.filter({selectedCategory.contains($0.category)})
                }
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
 
 
 1. Mutlithreading - api
 2. Picker view, Date picker
 3. maps
 4. Camera, Gallery
 5. notification - uilocalnotification
 6. Animation
 7. closures
 8. UIAlertView
 9. SwiftData
 10. Playing Audio and Video
 11. Sending mail and SMS from app
 12. 3rd Party Library
 
 
 */


