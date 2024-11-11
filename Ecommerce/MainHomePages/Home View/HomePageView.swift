//
//  HomePageView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 20/09/24.
//

import SwiftUI
import SwiftData

struct HomePageView: View {
    
    
    
    //    @State var forYouProductTitle: String = "For you"
    @State var productsForYou: String = "Products For You"
    
    @Query private var products: [ProductItem]
    @Environment(\.modelContext) private var modelContext
    
    
    @State private var product : ProductItem?
    @State private var selectedCategory : [Products.Category] = [.electronics]
    
    
    @State var isSelectedFilter: Bool = true
    @Binding var navigationPath : NavigationPath
//    @Environment (\.user) var user: User
    var body: some View {
        //        SearchView(search: "")
        ZStack
        {
            LinearGradient(gradient: Gradient(colors: [.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomLeading)
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack( content: {
                    SearchView(search: "", selectedCategory: $selectedCategory, isSelectedFilter: $isSelectedFilter, didFinishFilter: {
                        
//                        Filter your ProductItem
//                        do{
//                            let fetchDescriptor = FetchDescriptor<ProductItem>(predicate: #Predicate{
//                                selectedCategory.contains($0.category)
//                            })
//                            self.products = try modelContext.fetch(fetchDescriptor)
//                        }
//                        catch{
//                            
//                        }
                    })
                    Divider()
                    
                    ProductBannerView(product: $product)
                    Divider()
                    
                    ProductCollectionView(title: $productsForYou, didSelectProduct:{ product in
                        navigationPath.append(product)
                    })
                    
                    Divider()
                    Spacer()
                })
                
            }
            
        }
        .navigationDestination(for: ProductItem.self, destination: { product in
            ProductDetailView(product: Binding(get: {product}, set: {_ in }), navigationPath: $navigationPath)
        })
        .task {
            
            do{
                var products = try await Products.Request().load()
                
//                for product in products{
//                    
//                    let model = ProductItem(product: product)
//                    modelContext.insert(model)
//                }
                guard products.count > 0 else { return }
                
                

                
//                if isSelectedFilter{
//                    let fetchDescriptor = FetchDescriptor<ProductItem>(predicate: #Predicate{
//                        $0.category == .electronics
////                        selectedCategory.contains($0.category)
//                    })
//                    self.products = try modelContext.fetch(fetchDescriptor)
//                }
//                else{
//                    let fetchDescriptor = FetchDescriptor<ProductItem>()
//                    self.products = try modelContext.fetch(fetchDescriptor)
//                }
            }
            catch{
                print(error)
            }
        }
        
    }
}

#Preview {
    HomePageView( navigationPath: Binding(get: {
        NavigationPath()
    }, set: {_ in }))
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


