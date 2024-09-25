//
//  HomePageView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 20/09/24.
//

import SwiftUI

struct HomePageView: View {
    
    
    @State var forYouProducts: [Products.Product] = [Products.Product(id: UUID(), title: "Electronics", price: 0, description: "", category: .electronics, image: "Electronics", rating: .init(rate: 2, count: 5))]
    @State var forcategory: [Products.Product] = [Products.Product(id: UUID(), title: "FossilWatch", price: 0, description: "", category: .electronics, image: "FossilWatch", rating: .init(rate: 2, count: 5))]

    @State var forYouProductTitle: String = "For you"
    @State var forCategory: String = "Category"
    
    var body: some View {
//        SearchView(search: "")
        ZStack
        {
            LinearGradient(gradient: Gradient(colors: [.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomLeading)
                .ignoresSafeArea(.all)
            
            ScrollView
            {
                VStack(alignment: .leading, content: {
                    SearchView(search: "")
                    Divider()
                    HStack{
                        Spacer()
                        Text("For You")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    ProductBannerView()
                    Divider()
                  
                    ProductCollectionView(title: $forYouProductTitle, products: $forYouProducts)
                   
                    Divider()
                    Spacer()
                }
                
            }
//            Text("Footer")
//                .font(.title3)
//                .bold()
//                .foregroundColor(.black)
//                .frame(maxWidth: .infinity, alignment: .center)
//                .padding()
//                .background(Color.white)
            
        }
        
        
        
        
        
        
    }
}

#Preview {
    HomePageView()
}



