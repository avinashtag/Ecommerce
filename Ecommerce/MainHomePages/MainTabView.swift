//
//  TabView.swift
//  Ecommerce
//
//  Created by Pasham Srinivas Goud on 01/10/24.
//

import SwiftUI

struct MainTabView: View {
    @State var navigationPath : NavigationPath = NavigationPath()
    @State var navigationCartPath : NavigationPath = NavigationPath()

    var body: some View {
        TabView {
            NavigationStack(path: $navigationPath) {
                HomePageView(navigationPath: $navigationPath)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            NavigationStack(path: $navigationCartPath) {
                CartView()
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text("Cart")
            }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            //            SearchView(search: "")
            //                .tabItem {
            //                    Image(systemName: "magnifyingglass")
            //                    Text("Search")
            //                }
        }
    }
}

#Preview {
    MainTabView()
}

//struct funTab()
