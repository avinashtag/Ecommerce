//
//  HomePageView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 20/09/24.
//

import SwiftUI

struct HomePageView: View {
    
    var body: some View {
//        SearchView(search: "")
        ZStack
        {
            LinearGradient(gradient: Gradient(colors: [.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomLeading)
                .ignoresSafeArea(.all)
            
            ScrollView
            {
                VStack()
                {
                    SearchView(search: "")
                    Divider()
                    Text("For You")
                        .font(.title2)
                        .bold()
                    CategorieView()
                    Divider()
                    Spacer()
                    YouMayLikeView()
                }
                .padding()
            }
//            Spacer()
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



