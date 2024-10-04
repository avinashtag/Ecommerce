//
//  TabView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 01/10/24.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            BrandCheckBoxView()
                .tabItem {
                    Image(systemName: "distribute.vertical.center.fill")
                    Text("Categories")
                }
            Text("Cart")
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            SearchView(search: "")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

#Preview {
    MainTabView()
}

//struct funTab()
